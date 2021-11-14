//
//  recCard.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/16.
//

import SwiftUI

struct recCard: View {
    var title:String
    var imageUrl:String
    var body: some View {
        ZStack {           
            Image(uiImage: imageUrl.loadImage())
                .resizable()
                
                .scaledToFill()
                .frame(width: .infinity, height: 200)
                .cornerRadius(10)
                .brightness(-0.13)
                .padding(.horizontal)
                .shadow(radius: 10)
                .clipShape(Rectangle())
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
            
    }
}

struct recCard_Previews: PreviewProvider {
    static var previews: some View {
        recCard(title: "hello", imageUrl: "https://img9.doubanio.com/view/photo/l/public/p2687443734.webp")
    }
}
