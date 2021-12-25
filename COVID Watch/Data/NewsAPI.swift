//
//  NewsAPI.swift
//  COVID Watch
//
//  Created by Trevor Piltch on 11/12/20.
//

import SwiftUI
import Combine

struct NewsAPIFields: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Articles?]
}

struct Articles: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}

struct ForEachArticle: Identifiable {
    var id = UUID()
    var articles: [Articles]?
}

class NewsData: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var fields: NewsAPIFields? = nil  {
        didSet {
            objectWillChange.send()
        }
    }
}

let newsTestData = NewsAPIFields(status: "ok", totalResults: 0, articles: [Articles(source: Source(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: "")])
