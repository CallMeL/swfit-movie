//
//  movieRowView.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import SwiftUI

struct movieChartView: View {
    var categoryName: String
    var items: [Movie]
    @State private var showFavoritesOnly = false
    var filteredMovies:[Movie]{
        items.filter{movie in
            (!showFavoritesOnly||movie.isFavorite)
            
        }
    }
    var body: some View {

            List{
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                ForEach(filteredMovies){movie in
                    NavigationLink(
                        destination: movieDetailPage(movie: movie),
                        label: {
                            movieRow(movie: movie)
                        })
                    
                }
            }.navigationTitle(categoryName)

    }
}

struct movieChartView_Previews: PreviewProvider {
    static var movies = ModelData().movies
    
    static var previews: some View {
        movieChartView(categoryName: movies[0].region,
                       items: Array(movies.prefix(5)))
    }
}
