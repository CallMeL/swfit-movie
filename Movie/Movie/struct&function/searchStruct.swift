//
//  searchStruct.swift
//  Movie
//
//  Created by 陈汐 on 2021/10/12.
//

import Foundation
enum Country:String,CaseIterable {
    case cn = "中国大陆"
    case uk = "英国"
    case us = "美国"
}

enum SearchType:String,CaseIterable{
    case all = "全部"
    case director = "导演"
    case actor = "演员"
    case type = "类型"
    case book = "名著改编"
}

