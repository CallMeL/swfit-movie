//
//  bookRow.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/12.
//

import SwiftUI

struct bookRow: View {
    @EnvironmentObject var modelData: ModelData
    @State var book: Book
    var body: some View {
            
            HStack {
                Image(uiImage:book.cover.loadImage())
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(book.name)
                    Text(book.publishingHouse)
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
               
                Spacer()
            }
      
    }
}

struct bookRow_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var books = ModelData().books
    static var previews: some View {
        bookRow(book: books[0]).previewLayout(.fixed(width: 300, height: 100)).environmentObject(modelData)
    }
}
