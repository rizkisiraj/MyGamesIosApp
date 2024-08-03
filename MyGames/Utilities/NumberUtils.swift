//
//  NumberUtils.swift
//  MyGames
//
//  Created by Rizki Siraj on 03/08/24.
//

import Foundation

struct NumberUtils {
    static func formatRatingCount(_ number: Int) -> String {
        if number < 1000 {
            return "<1K"
        } else {
            let thousands = number / 1000
            return "\(thousands)K"
        }
    }

}
