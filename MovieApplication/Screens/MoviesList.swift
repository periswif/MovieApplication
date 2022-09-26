//
//  MoviesList.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import SwiftUI

struct MoviesList: View {
    @State private var isAddMoviePresented = false
    @State private var searchText = ""
    @State var allMovies = movies
    
    var body: some View {
        NavigationView {
            List(allMovies) { movie in
                NavigationLink(destination: {
                    MovieDetail(movie: movie)
                }, label: {
                    HStack {
                        Image(systemName: "film")
                            .foregroundColor(Color.purple)
                        Text(movie.title)
                            .padding(.vertical)
                            .padding(.leading)
                        Text(String("(\(movie.year))"))
                            .font(.caption)
                    }
                })
            }
            .searchable(text: $searchText,
                    placement:
                    .navigationBarDrawer(displayMode: .always)
                        , prompt: "Titre de film")
            .onChange(of: searchText.lowercased()) {
                movie in
                if !movie.isEmpty {
                    allMovies = movies.filter {
                        $0.title.lowercased()
                        .contains(movie) }
                    } else {
                        allMovies = movies
                    }
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isAddMoviePresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                    })
                    .sheet(isPresented: $isAddMoviePresented
                           , content: {
                               AddMovie(movies: $allMovies)
                           })
            )}
        
    }
}

struct MoviesList_Previews: PreviewProvider {
    static var previews: some View {
        MoviesList()
    }
}
