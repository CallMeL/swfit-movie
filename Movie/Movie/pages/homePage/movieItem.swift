//
//  movieItem.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/10.
//

import SwiftUI

struct movieItem: View {
    var item: Movie
    var body: some View {
        NavigationLink (destination: movieDetailPage(movie: item)){
            HStack {
                Image(uiImage:(item.cover.loadImage()))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 150)
                    .clipped()
                    .cornerRadius(8)
                    .shadow(radius: 3)
                intro(movie: item)
                    .padding(.leading)
                    .frame(height:150)
            }
        }
        
    }
}

struct movieItem_Previews: PreviewProvider {
    static var movies = ModelData().movies
    static var previews: some View {
        movieItem(item: movies[20])
    }
}

private struct intro: View {
    var movie:Movie
    var body: some View {
        let title = String(movie.name.prefix(while: { (character) -> Bool in
            return character != " "
        }))
        VStack(alignment: .leading){
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color.black)
            Text("")
            Text("导演：\(movie.director)").font(.caption)
            Text("演员：\(movie.actors)").lineLimit(2).font(.caption)
            Text(movie.storyline).font(.caption).lineLimit(3)
        }
    }
}
