//
//  load.swift
//  Movie
//
//  Created by 陈汐 on 2021/9/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var movies: [Movie] = load("director.json")
    @Published var books:[Book] = load("book.json")
    //@Published var trees = BinaryTree<Movie>()
    var features: [Movie] {
        movies.filter { $0.isFeatured }
    }
    var countries: [String: [Movie]] {
        Dictionary(grouping: movies, by: {$0.region})
    }
    var directors: [String: [Movie]] {
        Dictionary(grouping: movies, by: {$0.director})
    }
    var slugs: [String: [Movie]] {
        Dictionary(grouping: movies, by: {$0.slug})
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
