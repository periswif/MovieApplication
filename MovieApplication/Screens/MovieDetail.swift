//
//  MovieDetail.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import SwiftUI

struct MovieDetail: View {
    @State var movie: Movie
    var favoriteIcon: String {
        movie.isFavorite ? "heart.fill" : "heart"
    }
    
    var body: some View {
        
        VStack {
            
            HStack(alignment: .top) {
                
                Spacer()
                
                Button {
                    movie.isFavorite.toggle()
                } label: {
                    Image(systemName: favoriteIcon)
                        .font(.title2)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                }
            }
            
            Text(movie.title.capitalized)
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            Text("by \(movie.director.capitalized)")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 3)
            
            Text(String(movie.year))
                .italic()
                .font(.callout)
                .padding(.bottom)
            
            Image(movie.image)
                .resizable()
                .scaledToFit()
            
            Text(movie.genre.rawValue)
                .italic()
                .font(.callout)
                .padding(.top)
            
            Text(movie.pitch)
                .lineSpacing(8)
                .padding()
                .multilineTextAlignment(.center)
            
        }
        
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: movies[0])
    }
}
