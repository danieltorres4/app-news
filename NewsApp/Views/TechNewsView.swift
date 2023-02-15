//
//  MXNewsView.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 14/02/23.
//

import SwiftUI

struct TechNewsView: View {
    @StateObject var techNewsData = NewsData()
    
    var body: some View {
        NavigationView {
            List(techNewsData.techNews) { news in
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
            .navigationTitle("Apple News")
        }
    }
}

struct MXNewsView_Previews: PreviewProvider {
    static var previews: some View {
        TechNewsView()
    }
}
