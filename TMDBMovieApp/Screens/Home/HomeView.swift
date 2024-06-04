//
//  HomeView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import SwiftUI
import Shimmer

struct HomeView: View {
    @State var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                headerView

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        MovieView(title: "Upcomings", movies: viewModel.upcomingMovies)

                        MovieView(title: "Populars", movies: viewModel.populars)

                        MovieView(title: "Top Rated", movies: viewModel.topRatedMovies)
                    }
                }

                Spacer()
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
            .task {
                await viewModel.loadMovies()
            }
        }
    }

    var headerView: some View {
        VStack(alignment: .leading) {
            Text("Welcome back")
                .foregroundStyle(.secondary)
                .font(.caption)
            Text("Yogesh Patel")
                .font(.title)
        }
    }
  
}

#Preview {
    HomeView().preferredColorScheme(.dark)
}
