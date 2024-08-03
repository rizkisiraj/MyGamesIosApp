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
    var rating: Double
    var genres: [Genre]?
    var isLiked: Bool = false
    
    enum CodingKeys: String, CodingKey {
            case id, slug, name, released, background_image, rating, genres
    }
    
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            slug = try container.decode(String.self, forKey: .slug)
            name = try container.decode(String.self, forKey: .name)
            released = try container.decode(String.self, forKey: .released)
            background_image = try container.decode(String.self, forKey: .background_image)
            rating = try container.decode(Double.self, forKey: .rating)
            genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
    }
    
    init(id: Int, slug: String, name: String, released: String, background_image: String, rating: Double, genres: [Genre]?, isLiked: Bool = false) {
            self.id = id
            self.slug = slug
            self.name = name
            self.released = released
            self.background_image = background_image
            self.rating = rating
            self.genres = genres
            self.isLiked = isLiked
        }
    
    
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
    let results: [Game]
}

extension Game {
    static let gamePreview = Game(id: 3, slug: "mamak-kau", name: "Mamak Kau", released: "2013-09-17", background_image: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg", rating: 4.47, genres: [Genre(id:1, name: "Action")])
}
