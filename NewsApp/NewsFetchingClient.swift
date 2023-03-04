//
//  NewsFetchingClient.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 13/02/23.
//

import Foundation

struct NewsFetchingClient {
    static private let url = URL(string: "https://newsapi.org/v2/everything?q=keyword&from=2023-03-02&to=2023-03-03&sortBy=popularity&apiKey=2e97584872bf414686add666de9abdcb")!
    static private let urlTech = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-03-03&to=2023-03-03&sortBy=popularity&apiKey=2e97584872bf414686add666de9abdcb")!
    
    static func getNews() async throws -> [News] {
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Response.self, from: data)
        return response.news
    }
    
    static func getTechNews() async throws -> [News] {
        async let (data, _) = URLSession.shared.data(from: urlTech)
        let response = try await JSONDecoder().decode(Response.self, from: data)
        return response.news
    }
}
