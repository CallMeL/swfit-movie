//
//  myPage.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/19.
//

import SwiftUI
struct searchPage: View {
    @EnvironmentObject var modelData: ModelData
    @State var searchText = ""
    @State var searching = false
    //
    @State private var searchtype:SearchType = .book
    //
    init(){
        let newSwiftColor = UIColor(red: 128, green: 139, blue: 247)
        UISegmentedControl.appearance().selectedSegmentTintColor = newSwiftColor
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor:UIColor.white], for: .selected)
    }
    var body: some View {
        
        NavigationView{
            VStack {//007
                searchBar(searchText: $searchText, searching: $searching)
                    .padding(.horizontal)
                Picker("搜索",selection:$searchtype){
                    ForEach(SearchType.allCases,id:\.self){
                        Text($0.rawValue)
                    }
                    
                }.pickerStyle(SegmentedPickerStyle())
                .shadow(radius:5)
                
                List{
                    ForEach(modelData.search(type: searchtype.rawValue, searchKey: searchText, range: modelData.movies))
                    { movie in
                        NavigationLink(
                            destination: movieDetailPage(movie: movie),
                            label: {
                                HStack {
                                    Image(uiImage:movie.cover.loadImage())
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    let name = movie.name.components(separatedBy: " -")
                                    VStack(alignment: .leading) {
                                        Text(name[0])
                                        Text(movie.year)
                                        HStack {
                                            Text("vote:")
                                            Text(movie.vote)
                                        }
                                       
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
                            })

                    }
                    if searchtype.rawValue == "名著改编" && searchText != ""{
                        VStack(alignment: .leading) {
                            Text("原著")
                                .padding(.top)
                            bookRowSearch(bookname: searchText)
                        }
                    }
                }
                //记忆碎片克里斯 动作 文淇
                .navigationTitle(searching ? "searching":"search")
                .toolbar{
                    if searching{
                        Button("cancle"){
                            searchText=""
                            withAnimation{
                                searching = false
                                
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

struct searchPage_Previews: PreviewProvider {
    static var previews: some View {
        searchPage().environmentObject(ModelData())
    }
}

struct bookRowSearch: View {
    @EnvironmentObject var modelData: ModelData
    var bookname: String
    var body: some View {
        let book:Book? = modelData.books.first(where: {$0.name.contains(bookname)})
        if book == nil{
            Text("没有相关作品")
        }else{
            NavigationLink(
                destination: bookDetaileView(book: book ?? modelData.books[0]),
                label: {
                    bookRow(book: book ?? modelData.books[0])
                })
            
        }
    }
}
