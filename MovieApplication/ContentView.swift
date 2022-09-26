//
//  ContentView.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView {
            MoviesList()
                .tabItem {
                    Image(systemName: "film.circle.fill")
                    Text("Films")
                }
            Profil(user: user, movies: movies)
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profil")
                }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
