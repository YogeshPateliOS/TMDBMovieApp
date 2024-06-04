//
//  String+Extension.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import Foundation

extension String {

    var imageURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(self)")
    }

}
