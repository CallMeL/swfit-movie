//
//  searchFunc.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/11.
//
//https://hacknicity.medium.com/a-simple-smart-search-algorithm-for-ios-in-swift-65f71b2f221a
import Foundation
import UIKit
extension ModelData{
    func search(type:String,searchKey:String,range:[Movie]) -> [Movie] {
        var theResult:[Movie] = []
        switch type {
        case "导演":
            for movie in range {
                if movie.director.contains(searchKey){
                    theResult.append(movie)
                }
            }
        case "year":
            for movie in range {
                if movie.releaseData.contains(searchKey){
                    theResult.append(movie)
                }
            }
        case "演员":
            for movie in range {
                if movie.actors.contains(searchKey){
                    theResult.append(movie)
                }
            }
        case "类型":
            for movie in range {
                if movie.geners.contains(searchKey) || movie.tags.contains(searchKey){
                    theResult.append(movie)
                }
            }
        case "名著改编":
            for movie in movies {
                if movie.slug == "名著改编"{
                    if movie.name.contains(searchKey) || movie.alias.contains(searchKey){
                        theResult.append(movie)
                    }
                }
               
            }
        case "已收藏":
            for movie in movies {
                if movie.isFavorite{
                    theResult.append(movie)
                }
               
            }
        case "已投票":
            for movie in movies {
                if movie.isVoted{
                    theResult.append(movie)
                }
               
            }
            
        default:
            for movie in movies {
                if movie.name.contains(searchKey) || movie.alias.contains(searchKey){
                    theResult.append(movie)
                }
            }
        }
        return theResult
    }
}
