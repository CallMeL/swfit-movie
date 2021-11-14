//
//  userPage.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/20.
//

import SwiftUI
enum userChose:String,CaseIterable {
    case save = "已收藏"
    case vote = "已投票"
}
struct userPage: View {
    @EnvironmentObject var modelData: ModelData
    @State private var userchoose : userChose = .save
    // @State private var searchtype: userChose = .save
    init(){
        let newSwiftColor = UIColor(red: 128, green: 139, blue: 247)
        UISegmentedControl.appearance().selectedSegmentTintColor = newSwiftColor
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .bottom) {
                    Text("我的")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Spacer()
                    Image("agan")
                        .resizable()
                        .frame(width: 200.0, height: 110.0)
                }
                .padding(.leading)
             
                Picker("搜索",selection:$userchoose){
                    ForEach(userChose.allCases,id:\.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .shadow(radius:5)
                Spacer()
                List{
                    ForEach(modelData.search(type: userchoose.rawValue, searchKey: userchoose.rawValue, range: modelData.movies))
                    { movie in
                        NavigationLink(
                            destination: movieDetailPage(movie: movie),
                            label: {
                                movieItem(item: movie)
                            })
                        
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct userPage_Previews: PreviewProvider {
    static var previews: some View {
        userPage().environmentObject(ModelData())
    }
}
