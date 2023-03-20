//
//  NewResponce.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 17.03.2023.
//

import Foundation

struct NewsResponse: Codable{
    var status: String
    var totalResults: Int
    var articles: [New]
}
