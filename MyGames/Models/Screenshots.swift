//
//  Screenshots.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/08/24.
//

import Foundation

struct Screenshot: Codable {
    var id: Int
    var image: String
}

struct ScreenshotAPIResponse: Codable {
    var results: [Screenshot]
}
