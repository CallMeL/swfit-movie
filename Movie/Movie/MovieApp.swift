//
//  MovieApp.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/20.
//

import SwiftUI

@main
struct MovieApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
