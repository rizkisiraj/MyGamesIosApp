//
//  GameViewModel.swift
//  MyGames
//
//  Created by Rizki Siraj on 01/08/24.
//

import Foundation

class GameVM: ObservableObject {
    @Published var gamesArray: [Game]?
    @Published var isLoading: Bool = false
    let env = ProcessInfo.processInfo.environment
    
    func fetchGames() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let fetchedGames = try await getGamesDataFromAPI()
            DispatchQueue.main.async {
                self.gamesArray = fetchedGames
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
                print("ERROR: Could not get data from URL: \(Constant.baseURL).\(error.localizedDescription)")
            }
        }
    }
    
    func getGamesDataFromAPI() async throws -> [Game] {
        let urlString = URL(string: "\(Constant.baseURL)/\(Constant.gamesRoute)?key=\(env["API_KEY"] ?? "12")&page_size=5")
        guard let url = urlString else {
            print("ERROR: Couldn't convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("We are accessing the URL \(url)")
        
        let (data, response) = try await ApiService.shared.performNetworkRequest(url: url)
        
        try ApiService.shared.validateResponse(response)
        
        let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
        return apiResponse.results
    }
}
