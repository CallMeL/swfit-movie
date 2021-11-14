//
//  movieStruct.swift
//  myMovie
//
//  Created by 陈汐 on 2021/9/12.
//

import Foundation


struct Movie:Hashable, Codable, Identifiable,Comparable{
    //var description: String
    
    var id=UUID()
    var movieID:String
    var name:String
    var alias:String
    var actors:String
    var cover:String
    var score:String
    var vote:String
    var geners:String
    var imdbID:String
    var languages:String
    var mins:String
    var officialSite:String
    var releaseData:String
    var slug:String
    var storyline:String
    var tags:String
    var year:String
    var actorID:String
    var directorID:String
    var Vote:Int = 0
    var isFavorite:Bool = false
    var isVoted:Bool = false
    var isFeatured: Bool = false
    var region:String
    var director:String
    var hasOriginal:Bool = false
    var originalBookname:String = ""
    enum CodingKeys: String, CodingKey {
        case movieID="MOVIE_ID",name="NAME",alias="ALIAS",actors="ACTORS",cover="COVER",director="DIRECTORS",score="DOUBAN_SCORE"
        case vote="DOUBAN_VOTES",geners="GENRES",imdbID="IMDB_ID",languages="LANGUAGES",mins="MINS",officialSite="OFFICIAL_SITE"
        case region="REGIONS",releaseData="RELEASE_DATE",slug="SLUG",storyline="STORYLINE",tags="TAGS",year="YEAR",actorID="ACTOR_IDS",directorID="DIRECTOR_IDS"
    }
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        Int(lhs.vote) ?? 0 > Int(rhs.vote) ?? 0
    }
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
struct Rating: Codable {
  let ratingID: String
  let score: String
  let comment: String
}


