//
//  chartDiretor.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/25.
//

import SwiftUI

struct chartDiretor: View {
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        VStack {
            personItem(items: modelData.directors["克里斯托弗·诺兰"] ?? Array(modelData.movies.prefix(5)) , imageUrl: "https://img2.doubanio.com/view/celebrity/raw/public/p21241.jpg", imageName: "克里斯托弗·诺兰")
                .padding([.top, .leading, .trailing])
           
            // 宫崎骏
            space()

            personItem(items: modelData.directors["宫崎骏"] ?? Array(modelData.movies.prefix(5)) , imageUrl: "https://img9.doubanio.com/view/celebrity/raw/public/p616.jpg", imageName: "宫崎骏")
                .padding([.top, .leading, .trailing])
            //.navigationTitle("精选影人")
            space()
            personItem(items: modelData.search(type: "演员", searchKey: "赞达亚", range: modelData.movies),imageUrl:"https://img1.doubanio.com/view/photo/l/public/p2565431388.webp", imageName: "赞达亚")
                .padding([.top, .leading, .trailing])
        }
        .navigationTitle("精选影人")

    }
}

struct chartDiretor_Previews: PreviewProvider {
    static var previews: some View {
        chartDiretor().environmentObject(ModelData())
    }
}

struct space: View {
    var body: some View {
        VStack{
            Text("")
            Text("")
            Text("")
        }
    }
}
