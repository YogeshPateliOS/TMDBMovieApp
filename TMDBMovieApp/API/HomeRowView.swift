//
//  HomeRowView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import SwiftUI
import Kingfisher

struct HomeRowView: View {
    let movie: Movie

    var body: some View {
        VStack {
            KFImage(movie.backdropPath?.imageURL)
                .resizable()
                .scaledToFill()
                .scaleEffect(1.1)
                .frame(width: 120, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            Text(movie.originalTitle)
                .font(.headline)
                .lineLimit(2)
                .frame(width: 130)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }

}

#Preview {
    HomeRowView(movie: .dummy)
}
