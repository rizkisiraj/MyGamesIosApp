//
//  Game.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/07/24.
//

import Foundation

struct Game: Codable {
    var id: Int
    var slug: String
    var name: String
    var released: String
    var background_image: String
    var rating: String
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
