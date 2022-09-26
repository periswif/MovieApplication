//
//  Models.swift
//  MovieApplication
//
//  Created by Arnaud Nativel on 25/09/2022.
//

import Foundation

enum Genre: String {
    case thriller = "Thriller"
    case romantic = "Romantique"
    case action = "Action"
    case drama = "Drama"
}

struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var director: String
    var image: String
    var pitch: String
    var year: Int
    var genre: Genre
    var isFavorite: Bool
}

struct User: Identifiable {
    var id = UUID()
    var name: String
    var avatar: String
    var birthDate: String
    var description: String
    var preferredGenre: [Genre]
}
