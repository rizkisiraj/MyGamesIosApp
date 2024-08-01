//
//  ApiService.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/07/24.
//

import Foundation

class ApiService {
    static let shared = ApiService()
    
    private init() {
        
    }
    
    func performNetworkRequest(url: URL) async throws -> (Data, URLResponse) {
        let (data, response) = try await URLSession.shared.data(from: url)
        return (data, response)
    }
    
    func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...229).contains(httpResponse.statusCode) else {
            throw URLError(.init(rawValue: httpResponse.statusCode))
        }
    }
}
