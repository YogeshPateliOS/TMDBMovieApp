//
//  HomeViewModel.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

@Observable class HomeViewModel {

    var populars: [Movie] = []
    var topRatedMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    private let apiManager = APIManager()

    func loadMovies() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.loadPopularMovies() }
            group.addTask { await self.loadTopRatedMovies() }
            group.addTask { await self.loadUpcomingMovies() }
        }
    }

    private func loadPopularMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.popular)
            self.populars = response.results
        }catch {
            print(error)
        }
    }

    private func loadTopRatedMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.topRated)
            self.topRatedMovies = response.results
        }catch {
            print(error)
        }
    }

    private func loadUpcomingMovies() async {
        do {
            let response: MovieResponseModel = try await apiManager.request(type: MovieEndPoint.upcoming)
            self.upcomingMovies = response.results
        }catch {
            print(error)
        }
    }

}
