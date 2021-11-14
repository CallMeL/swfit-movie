//
//  chartNow.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/18.
//

import SwiftUI

struct chartNow: View {
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        List{
 //           ScrollView{
                ForEach(modelData.search(type: "year", searchKey: "2021", range: modelData.movies))
                { movie in
                    NavigationLink(
                        destination: movieDetailPage(movie: movie),
                        label: {
                            movieItem(item: movie)
                        })
                    
                }
  //          }
            
        }
        .navigationTitle("正在热映")
    }
    
}

struct chartNow_Previews: PreviewProvider {
    static var previews: some View {
        chartNow().environmentObject(ModelData())
    }
}
