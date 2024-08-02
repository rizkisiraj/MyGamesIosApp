//
//  Game.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/07/24.
//

import Foundation

struct Genre: Codable {
    var id: Int
    var name: String
}

struct Game: Codable {
    var id: Int
    var slug: String
    var name: String
    var released: String
    var background_image: String
    var rating: String
    var genres: [Genre]?
    var isLiked: Bool = false
}

struct GameDetail: Codable {
    var id: Int
    var slug: String
    var name: String
    var metacritic: Int
    var released: String
    var background_image: String
    var rating: Int
    var playtime: Int
    var ratings_count: Int
}

struct ApiResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Game]
}

extension Game {
    static let gamePreview = Game(id: 3, slug: "mamak-kau", name: "Mamak Kau", released: "2013-09-17", background_image: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: "4.47", genres: [Genre(id:1, name: "Action")])
}
