//
//  GameDetailVM.swift
//  MyGames
//
//  Created by Rizki Siraj on 03/08/24.
//

import Foundation

class GameDetailVM: ObservableObject {
    @Published var game: GameDetail?
    @Published var isLoading: Bool = false
    var id: Int = 3498
    let env = ProcessInfo.processInfo.environment
    
    init(game: GameDetail? = nil, isLoading: Bool = false, id: Int = 3498) {
        self.game = game
        self.isLoading = isLoading
        self.id = id
    }
    
    func fetchGames() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let fetchedGame = try await getGamesDataFromAPI(id: id)
            DispatchQueue.main.async {
                self.game = fetchedGame
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
                print("ERROR: Could not get data from URL: \(Constant.baseURL).\(error.localizedDescription)")
            }
        }
    }
    
    func getGamesDataFromAPI(id: Int) async throws -> GameDetail {
        let urlString = URL(string: "\(Constant.baseURL)\(Constant.gamesRoute)/\(id)?key=\(env["API_KEY"] ?? "12")")
        guard let url = urlString else {
            print("ERROR: Couldn't convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("We are accessing the URL \(url)")
        
        let (data, response) = try await ApiService.shared.performNetworkRequest(url: url)
        
        try ApiService.shared.validateResponse(response)
        
        let gameDetailResponse = try JSONDecoder().decode(GameDetail.self, from: data)
        
        return gameDetailResponse
    }
}
