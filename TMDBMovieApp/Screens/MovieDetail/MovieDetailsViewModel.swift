//
//  MovieDetailsViewModel.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 18/04/24.
//

import Foundation

@Observable class MovieDetailsViewModel {

    var casts: [CastModel] = []
    private let manager = APIManager()

    func loadCasts(id: Int) async {
        do {
            let response: CastResponseModel = try await manager.request(type: MovieEndPoint.credits(movieID: id))
            self.casts = Array(response.cast.prefix(10))
        }catch {
            print(error)
        }
    }

}
