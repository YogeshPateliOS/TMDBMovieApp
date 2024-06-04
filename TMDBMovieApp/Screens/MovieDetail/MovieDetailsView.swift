//
//  MovieDetailsView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 16/04/24.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    @State var viewModel = MovieDetailsViewModel()
    let movie: Movie

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    KFImage(movie.backdropPath?.imageURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height * 0.4
                        )
                        .clipped()

                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            VStack(spacing: 8) {
                                Image(systemName: "play.circle")
                                    .resizable()
                                    .fontWeight(.light)
                                    .frame(width: 80, height: 80, alignment: .center)
                                    .foregroundColor(.white)
                                Text("Play trailer")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                            }
                        })

                    }

                }

                Spacer()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(movie.originalTitle)
                            .font(.title)

                        HStack(spacing: 16) {
                            Text("18+")
                                .font(.caption)
                                .padding(8)
                                .padding(.horizontal, 8)
                                .background(Capsule().stroke())

                            HStack(spacing: 16) {
                                Text("3h 12m")
                                    .font(.subheadline)

                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 5, height: 5)

                                Text(movie.releaseDate)
                                    .font(.subheadline)
                            }
                            .foregroundStyle(.secondary)

                            Spacer()
                        }

                        HStack(spacing: 8) {
                            VStack(spacing: 5) {
                                Image(systemName: "square.and.arrow.down")
                                Text("Download")
                                    .font(.footnote)
                            }

                            Spacer()

                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Play Now")
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .tint(.white)
                                    .font(.headline)
                                    .background(.blue)
                                    .clipShape(.capsule)
                            })
                        }

                        Text(movie.overview)
                            .foregroundStyle(.secondary)
                            .font(.callout)
                            .lineLimit(4)

                        Spacer()

                        Text("Cast")
                            .font(.title3)
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            LazyHStack(alignment: .top,content: {
                                ForEach(viewModel.casts) { cast in
                                    VStack {
                                        KFImage(cast.imageURL?.imageURL)
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(1)
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            .clipped()
                                        Text(cast.name)
                                    }
                                    .frame(width: 80)
                                }
                            })
                        })

                        Spacer()
                    }
                    .padding()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height * 0.6
                    )
                }
            }
            .task {
                await viewModel.loadCasts(id: movie.id)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MovieDetailsView(movie: .dummy)
}
