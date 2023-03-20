//
//  New.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 17.03.2023.
//

import Foundation


struct New: Codable, Hashable {
    
    static func == (lhs: New, rhs: New) -> Bool {
        return lhs.title == rhs.title &&
        lhs.author == rhs.author &&
        lhs.url == rhs.url &&
        lhs.sourse?.id == rhs.sourse?.id &&
        lhs.sourse?.name == rhs.sourse?.name
    }
    
    var sourse: NewSource?
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String?
    
}

struct NewSource: Codable, Equatable, Hashable{
    var id: String
    var name: String
}

struct NewsResponse: Codable{
    var status: String
    var totalResults: Int
    var articles: [New]
}
