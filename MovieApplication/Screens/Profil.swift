//
//  Profil.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import SwiftUI

struct Profil: View {
    @State var user: User
    @State var movies: [Movie]
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image(user.avatar)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 150, alignment: .center)
                    .shadow(color: .gray, radius: 10, x: 5,  y: 5)
                    .padding()
                
                Text("@\(user.name)")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text(user.birthDate)
                    .padding()
                    .font(.callout)
                    .fontWeight(.heavy)
                
                Text(user.description)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                
                List {
                    
                    Section("Genres préférés") {
                        
                        HStack {
                            ForEach(user.preferredGenre, id: \.self) { genre in
                                if genre != user.preferredGenre.last {
                                    Text("\(genre.rawValue),")
                                } else {
                                    Text("\(genre.rawValue)")
                                }
                            }
                        }
                    }
                    
                    Section ("Films préférés") {
                        
                        VStack {
                            
                            ForEach(movies) { movie in
                                if movie.isFavorite == true {
                                    HStack {
                                        Text(movie.title)
                                    }
                                }
                            }
                        }
                    }
                }
                .headerProminence(.increased)
                
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil(user: user, movies: movies)
    }
}
