//
//  News.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 13/02/23.
//

import Foundation

struct Response: Decodable {
    let news: [News]
    
    enum CodingKeys: String, CodingKey {
        case news = "articles"
    }
}

struct News: Decodable, Identifiable {
    let id: String
    let source: Source
    let title: String
    let description: String?
    var author: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String
    let noticeURL: URL?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decode(Source.self, forKey: .source)
        title = try values.decode(String.self, forKey: .title)
        content = try values.decode(String.self, forKey: .content)
        publishedAt = try values.decode(String.self, forKey: .publishedAt)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        print("\n\n Author value: \(author ?? "Unknown") \n\n")
        id = try values.decode(String.self, forKey: .url)
        noticeURL = URL(string: id)
    }
    
    enum CodingKeys: String, CodingKey {
        case source
        case url
        case title
        case content
        case publishedAt
        case author
        case description
        case urlToImage
    }
    
}

extension News {
    init(id: String, title: String, author: String, publishedAt: String, content: String) {
        self.id = id
        self.title = title
        self.publishedAt = publishedAt
        self.content = content
        self.author = author
        self.source = Source(name: "Testing Source")
        self.description = "Description..."
        self.urlToImage = "Image"
        self.noticeURL = URL(string: "www.google.com")
    }
    
    static let testNews = News(
        id: "1234567890",
        title: "Lorem ipsum",
        author: "Image",
        publishedAt: "2023/02/14",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor cursus turpis, et luctus nisi accumsan ut. Etiam viverra turpis sit amet maximus vulputate. Donec posuere lectus massa, nec vestibulum purus ultricies non. Praesent accumsan fringilla lacus et laoreet. Vivamus consectetur finibus elit, vel elementum tortor vulputate vitae."
        
    )
}

struct Source: Decodable {
    let name: String
}
