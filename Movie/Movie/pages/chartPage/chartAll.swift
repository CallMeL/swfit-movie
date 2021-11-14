//
//  chartAll.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/8.
//

import SwiftUI

struct chartAll: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var body: some View {
            List {
                ForEach(modelData.movies) { movie in
                    NavigationLink(destination:movieDetailPage(movie: movie)) {
                        HStack {
                            Image(uiImage:movie.cover.loadImage())
                                .resizable()
                                .frame(width: 50, height: 50)
                            let name = movie.name.components(separatedBy: " -")
                            VStack(alignment: .leading) {
                                Text(name[0])
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
        }
        .onAppear{
            modelData.movies.quickSort()
        }
        
    }
}

struct chartAll_Previews: PreviewProvider {
    //static var modelData = ModelData()
    static var previews: some View {
        chartAll().environmentObject( ModelData())
    }
}
