//
//  movieRow.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import SwiftUI

struct movieRow: View {
    var movie: Movie

    var body: some View {
        //var he = movie.isFavorite ? "1":"0"
        
        HStack {
            Image(uiImage:movie.cover.loadImage())
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(movie.name)
                Text(movie.vote)
            }

            Spacer()
            if movie.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            if movie.isVoted{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.purple)
            }
        }
    }
}

struct movieRow_Previews: PreviewProvider {
    //static let modelData = ModelData()
    static var movies = ModelData().movies

    static var previews: some View {
        Group {
            movieRow(movie: movies[0])
            movieRow(movie: movies[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
