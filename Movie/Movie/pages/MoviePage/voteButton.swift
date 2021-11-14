//
//  voteButton.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import SwiftUI

struct voteButton: View {
    @Binding var isSet: Bool
    @Binding var voteNume:String
    @State private var temp = 1
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                isSet.toggle()
                if isSet{
                    temp = Int(voteNume) ?? 0
                    temp = temp + 1
                    voteNume = String(temp)
                }else{
                    temp = Int(voteNume) ?? 0
                    temp = temp - 1
                    voteNume = String(temp)
                }
                
            }) {
                HStack {
                    Image(systemName: isSet ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .foregroundColor(isSet ? Color.purple : Color.black)
                    Text("votes: "+voteNume)
                        .foregroundColor(Color.gray)
                }
            }
//            Text("vote")
//                .foregroundColor(Color.gray)
           
                
               
        }
        
    }
}

struct voteButton_Previews: PreviewProvider {
    static var previews: some View {
        voteButton(isSet: .constant(true), voteNume: .constant("0"))
    }
}
