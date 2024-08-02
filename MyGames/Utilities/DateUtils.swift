//
//  DateUtils.swift
//  MyGames
//
//  Created by Rizki Siraj on 02/08/24.
//

import Foundation

struct DateUtils {
    static func formatDateString(from input: String) -> String? {
        // Initialize the DateFormatter
        let dateFormatter = DateFormatter()
        
        // Set the input format
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Convert the input string to a Date object
        guard let date = dateFormatter.date(from: input) else {
            // Return nil if the input string cannot be parsed
            return nil
        }
        
        // Set the output format
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        // Convert the Date object to the desired output string
        let outputString = dateFormatter.string(from: date)
        
        return outputString
    }
}
