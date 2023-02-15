//
//  NewsView.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 13/02/23.
//

import SwiftUI


struct NewsView: View {
    @StateObject var newsData = NewsData()
    
    var body: some View {
        NavigationView {
            List(newsData.news) { news in
                NavigationLink(destination: SingleNoticeView(notice: news)) {
                    Text(news.title).font(.title2).bold()
                }
                VStack {
                    Spacer()
                    Text("Source: \(news.source.name)").font(.headline)
                    Text("Author: \(news.author ?? "Unknown")").font(.headline)
                    Text("Published at: \(news.publishedAt)").font(.headline)
                    Spacer()
                    Text(news.description ?? "").lineLimit(2)
                }
                Spacer()
            }
            .navigationTitle("All News")
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
