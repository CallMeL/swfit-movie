//
//  searchBar.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/4.
//

import SwiftUI

struct searchBar: View {
    @Binding var searchText:String
    @Binding var searching:Bool
    
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(Color("searchBar"))
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("search..",text:$searchText){
                    startedSearching in
                    if startedSearching{
                        withAnimation{
                            searching = true
                        }
                    }
                } onCommit:{
                    searching = false
                }
            }
            .foregroundColor(.gray)
            .padding()
        }
        .frame(width: nil, height: 40.0)
        .cornerRadius(13)
       
    }
    
}

struct searchBar_Previews: PreviewProvider {
    static var previews: some View {
        searchBar(searchText: .constant(""), searching: .constant(false))
    }
}
