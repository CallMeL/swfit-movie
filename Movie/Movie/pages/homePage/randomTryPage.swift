//
//  randomTryPage.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/12.
//

import SwiftUI

struct randomTryPage: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var isPresented:Bool
    //Binding:recive from outside, a pramater
    let randomInt = Int.random(in: 0..<30)
    var body: some View {
        ZStack {
            
            VStack(spacing: -40) {
                HStack {
                    Image(systemName: "hands.sparkles.fill")
                        .scaleEffect(CGSize(width: 1.3, height: 1.3))
                        
                        .foregroundColor(.red)
                    Text("试试手气")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                }
                .padding(.top)
                movieDetailPage(movie: modelData.movies[randomInt])
            }
        }
    }
}

struct randomTryPage_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        randomTryPage(isPresented: Binding<Bool>.constant(false)).environmentObject(modelData)
    }
}
