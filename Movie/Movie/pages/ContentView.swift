//
//  ContentView.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/12.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case chart
        case search
        case user
    }

    var body: some View {
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.featured)

            chartPage()
                .tabItem {
                    Label("chart", systemImage: "list.star")
                }
                .tag(Tab.search)
            
            searchPage()
                .tabItem {
                    Label("search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            userPage()
                .tabItem {
                    Label("my", systemImage: "face.smiling")
                }
                .tag(Tab.user)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

