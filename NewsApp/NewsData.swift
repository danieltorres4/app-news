//
//  NewsData.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 13/02/23.
//

import Foundation

@MainActor
class NewsData:ObservableObject {
    @Published var news: [News] = []
    @Published var techNews: [News] = []
    
    init() {
        Task {
            await loadNews()
            await loadTechNews()
        }
    }
    
    func loadNews() async {
        do {
            let news = try await NewsFetchingClient.getNews()
            self.news = news
        } catch {
            print(error)
        }
    }
    
    func loadTechNews() async {
        do {
            let techNews = try await NewsFetchingClient.getTechNews()
            self.techNews = techNews
        } catch {
            print(error)
        }
    }
}
