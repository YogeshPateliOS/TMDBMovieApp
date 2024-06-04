//
//  MovieModel.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

struct MovieResponseModel: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let originalTitle, overview: String
    let posterPath: String?
    let releaseDate, title: String
    let backdropPath: String?
    let popularity, voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case backdropPath = "backdrop_path"
    }
}

extension Movie {

    static var dummy: Movie {
        .init(id: 693134,
         originalTitle: "Dune: Part Two",
         overview: "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee.",
         posterPath: "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
         releaseDate: "2024-02-27",
              title: "Dune: Part Two",
              backdropPath: "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg",
         popularity: 4661.985,
         voteAverage: 8.309,
         voteCount: 2827)
    }
}
