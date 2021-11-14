//
//  bookDetaileView.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/14.
//

import SwiftUI

struct bookDetaileView: View {
    @EnvironmentObject var modelData: ModelData
    var book:Book
    var body: some View {
        VStack {
            ZStack {
                Image("undraw_Books_l33t")
                    .resizable()
                    .frame(height: 250)
                Image(uiImage:(book.cover.loadImage()))
                    .resizable()
                    .frame(width: 180, height: 280)
                    .cornerRadius(10)
                    .shadow(radius: 35)
            }
            Text(book.name)
                .font(.title)
                .fontWeight(.bold)
            Text(book.origninalName).fontWeight(.bold)
            Text(book.author)
            Text("")
            VStack(alignment: .leading) {
                Text("ISBN："+book.ISBN)
                Text("")
                Text("剧情简介："+book.storyline)
                Text("")
                HStack {
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.blue)
                    Link("购买链接", destination: URL(string: book.link)!)
                }
            }
            .padding(.horizontal)
            Spacer()
                    
        }
        
    }
}

struct bookDetaileView_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        bookDetaileView(book: modelData.books[0]).environmentObject(modelData)
    }
}
