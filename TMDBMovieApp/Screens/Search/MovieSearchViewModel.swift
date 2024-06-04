//
//  MovieSearchViewModel.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 19/04/24.
//

import Foundation

@Observable class MovieSearchViewModel {
    
    var movies: [Movie] = []
    private let manager = APIManager()
    private var searchTask: Task<Void, Error>?

    func searchMovie(by name: String) {
        searchTask?.cancel()

        searchTask = Task {
            do {
                // Simulate debounce by delaying the search task
                try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds

                let response: MovieResponseModel = try await manager.request(
                    type: MovieEndPoint.search(name: name)
                )
                self.movies = response.results
            }catch {
                print(error)
            }
        }
    }

}
