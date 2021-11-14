//
//  chartPage.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/16.
//

import SwiftUI

struct chartPage: View {
    @EnvironmentObject var modelData: ModelData
    var movies: [Movie] = []

    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink(
                    destination: chartPart(),
                    label: {
                        recCard(title: "热度测试", imageUrl: "https://img9.doubanio.com/view/photo/m/public/p2657602843.webp")
                    })
                NavigationLink(
                    destination: chartAll(),
                    label: {
                        recCard(title: "热度总榜", imageUrl: "https://img9.doubanio.com/view/photo/m/public/p2655030796.webp")
                    })
                NavigationLink(
                    destination: chartDiretor(),
                    label: {
                        recCard(title: "精选影人", imageUrl: "https://img2.doubanio.com/view/photo/l/public/p2584331372.webp")
                    })
                NavigationLink(
                    destination: chartNow(),
                    label: {
                        recCard(title: "正在热映", imageUrl: "https://img2.doubanio.com/view/photo/l/public/p2657247312.webp")
                    })
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct chartPage_Previews: PreviewProvider {
    
    static var previews: some View {
        chartPage().environmentObject(ModelData())
    }
}
