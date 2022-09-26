//
//  AddMovie.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import SwiftUI

struct AddMovie: View {
    // Environnement pour accéder aux fonctions existantes de l'écran modal
    @Environment(\.presentationMode) var presentationMode
    
    @State var title: String = ""
    @State var director: String = ""
    @State var pitch: String = ""
    @State var year: String = ""
    @State var selectedGenre: Genre = .drama
    
    // var Binding pour pouvoir enregistrer le nouveau film dans la liste de l'écran parent (liée à une var State dans la vue Liste)
    
    @Binding var movies: [Movie]
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Form {
                    
                    Section("Caractéristiques") {
                        TextField("Titre du film", text: $title)
                        TextField("Réalisateur", text: $director)
                        TextField("Année de sortie", text: $year)
                    }
                    
                    Section("Synospis") {
                        TextField("Pitch", text: $pitch)
                            .frame(height: 200, alignment: .top)
                            .multilineTextAlignment(.leading)
                    }
                    // Picker
                    Section("Genre") {
                        Picker("Genre", selection: $selectedGenre) {
                            Text("Drame").tag(Genre.drama)
                            Text("Action").tag(Genre.action)
                            Text("Romantique").tag(Genre.romantic)
                            Text("Thriller").tag(Genre.thriller)
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }
                }
                
                // Bouton sauvegarder avec func AddMovie() et func dismiss() quand film sauvegardé
                
                VStack(alignment: .center) {
                    Button(action: {
                        AddMovie()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Sauvegarder")
                    })
                }
                Spacer()
            }
            
            .navigationTitle("Ajouter un film")
            .navigationBarTitleDisplayMode(.inline)
            // Bouton pour fermer l'écran modal dans la navigation bar
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Fermer")
                    }))
        }
        
    }
    
    func AddMovie() {
        movies.append(Movie(title: title, director: director, image: "Infiltres", pitch: pitch, year: Int(year) ?? 0, genre: selectedGenre, isFavorite: false))
    }
}

struct AddMovie_Previews: PreviewProvider {
    static var previews: some View {
        AddMovie(movies: .constant([Movie(title: "", director: "", image: "", pitch: "", year: 1, genre: .drama, isFavorite: false)]))
    }
}
