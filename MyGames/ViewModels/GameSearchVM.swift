//
//  GameSearchVM.swift
//  MyGames
//
//  Created by Rizki Siraj on 01/10/24.
//

import Foundation
import Combine

@MainActor
class GameSearchVM: ObservableObject {
    
    enum State: Comparable {
            case good
            case isLoading
            case loadedAll
            case error(String)
    }
    
    var link: String? = nil
    @Published var searchTerm: String = ""
    @Published var games: [Game] = [Game]()
    let env = ProcessInfo.processInfo.environment
    
    @Published var state: State = .good {
        didSet {
            print("state changed to: \(state)")
        }
    }
    
    let limit: Int = 24
    var page: Int = 0
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .milliseconds(500) , scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] term in
                Task { [weak self] in
                    guard let self = self else { return }
                    DispatchQueue.main.async {
                        self.state = .good
                        self.games = []
                    }
                    await self.fetchGames(for: term)
                }
            }.store(in: &subscriptions)
    }
    
    func loadMore() async {
        await fetchGames(for: searchTerm)
    }
    
    func fetchGames(for searchTerm: String) async {
        guard !searchTerm.isEmpty else {
            return
        }
        
        guard state == State.good else {
            return
        }
        
        state = .isLoading
        
        do {
            let fetchedGames = try await getGamesDataFromAPI()
            DispatchQueue.main.async {
                for game in fetchedGames {
                    self.games.append(game)
                }
                self.state = (self.link != nil) && (self.games.count < self.limit) ? .good : .loadedAll
                print("fetched \(fetchedGames.count)")
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .error("Error: \(error)")
                print("ERROR: Could not get data from URL: \(Constant.baseURL).\(error)")
            }
        }
    }
    
    func getGamesDataFromAPI() async throws -> [Game] {
        let urlString = (self.link != nil) ? URL(string: self.link!) : URL(string: "\(Constant.baseURL)\(Constant.gamesRoute)?key=\(env["API_KEY"] ?? "12")&page_size=8&page=1&search=\(searchTerm)&search_exact=1")
        
        guard let url = urlString else {
            print("ERROR: Couldn't convert \(urlString?.absoluteString ?? "unknown") to a URL")
            throw URLError(.badURL)
        }
        
        print("We are accessing the URL \(url)")
        
        let (data, response) = try await ApiService.shared.performNetworkRequest(url: url)
        
        try ApiService.shared.validateResponse(response)
        
        let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
        self.link = apiResponse.next
        
        return apiResponse.results
    }
}
