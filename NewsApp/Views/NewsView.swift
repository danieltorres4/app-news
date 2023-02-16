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
                HStack {
                    if news.urlToImage != nil {
                        AsyncImage(url: URL(string: news.urlToImage!)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .padding()
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Image(systemName: "newspaper.fill")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(20)
                            .padding()
                    }
                    
                    VStack {
                        Text("Source: \(news.source.name)").font(.headline)
                            .padding()
                        Text("Author: \(news.author ?? "Unknown")").font(.headline)
                            .padding()
                        Text("Published at: \(news.publishedAt)").font(.headline)
                            .padding()
                        Text(news.description ?? "").lineLimit(2)
                    }
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
