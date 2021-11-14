//
//  personItem.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/6.
//

import SwiftUI

struct personItem: View {
    var items: [Movie]
    var imageUrl:String
    var imageName:String
    var body: some View {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    VStack {
                        Image(uiImage:(imageUrl.loadImage()))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130.0, height: 130.0)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            
                        Text(imageName)
                            .padding(.top)
                    }
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

struct personItem_Previews: PreviewProvider {
    static var movies = ModelData().movies
    static var previews: some View {
        personItem(items: Array(movies.prefix(4)), imageUrl:"https://img1.doubanio.com/view/photo/l/public/p2568547808.webp",imageName:"文淇")
    }
}
