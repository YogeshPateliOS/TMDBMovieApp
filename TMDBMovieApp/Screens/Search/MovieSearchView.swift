//
//  MovieSearchView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 19/04/24.
//

import SwiftUI
import Kingfisher

struct MovieSearchView: View {

    @State var viewModel = MovieSearchViewModel()
    @State var searchText: String = ""
    private let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                            HomeRowView(movie: movie)
                                .foregroundColor(.primary)
                        }
                    }
                }.padding(8)
            }
        }
        .searchable(text: $searchText, prompt: "Search movie by name")
        .onChange(of: searchText) { _, newValue in
            if newValue.isEmpty {
                viewModel.movies.removeAll()
            }else {
                viewModel.searchMovie(by: newValue)
            }
        }
    }
}

#Preview {
    MovieSearchView()
}
