//
//  CategoryItem.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import SwiftUI

struct CategoryItem: View {
    var movie: Movie
    @State private var title:String = ""
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage:(movie.cover.loadImage()))
                .renderingMode(.original)
                .resizable()
                .frame(width: 140, height: 200)
                .cornerRadius(5)
            Text(title)
                .foregroundColor(.primary)
                .font(.caption)
                .padding(.bottom)
        }
        .padding(.leading, 15)
        .onAppear(){
            title = String(movie.name.prefix(while: { (character) -> Bool in
                return character != " "
            }))
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(movie: ModelData().movies[5])
    }
}
