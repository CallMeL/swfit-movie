//
//  bookStruct.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/12.
//

import Foundation
struct Book:Hashable, Codable, Identifiable,Comparable{
    //var description: String
    
    static func < (lhs: Book, rhs: Book) -> Bool {
        return lhs.name > rhs.name
    }
    
    var id = UUID()
    var name:String
    var origninalName:String
    
    var author:String
    var data:String
    var storyline:String
    var cover:String
    var publishingHouse:String
    var link:String
    var ISBN:String
    
    enum CodingKeys: String, CodingKey {
        case name = "name",author="author",data="data",storyline="storyline",cover="cover",publishingHouse="publishingHouse"
        case link="link",ISBN="ISBN",origninalName="origninalName"
    }

}
