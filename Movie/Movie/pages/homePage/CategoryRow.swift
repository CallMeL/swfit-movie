//
//  CategoryRow.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Movie]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding([.leading, .bottom], 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { movie in
                        NavigationLink (destination: movieDetailPage(movie: movie)){
                            CategoryItem(movie: movie)
                        }
                    }
                    .shadow(radius: 3)
                }
            }
            .padding(.top)
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var movies = ModelData().movies

    static var previews: some View {
        CategoryRow(
            categoryName: movies[0].region,
            items: Array(movies.prefix(4))
        )
    }
}

