//
//  SingleNoticeView.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 14/02/23.
//

import SwiftUI

struct SingleNoticeView: View {
    var notice: News
    @State private var showWebView = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text(notice.title).font(.title).bold()
                
                if notice.urlToImage != nil {
                    AsyncImage(url: URL(string: notice.urlToImage!)) { image in
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
                
                VStack(spacing: 16) {
                    Button("Check the full notice!") {
                        showWebView = true
                    }.sheet(isPresented: $showWebView) {
                        WebView(url: notice.id)
                    }
                }
                .padding()
                
                Text("Source: \(notice.source.name)").font(.subheadline)
                Text("Author: \(notice.author ?? "Unknown")").font(.subheadline).padding()
                Text(notice.content).font(.headline)
            }
        }
    }
}

struct SingleNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        SingleNoticeView(notice: News(
            id: "1234567890",
            title: "Lorem ipsum",
            author: "Author",
            publishedAt: "2023/02/14",
            content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempor cursus turpis, et luctus nisi accumsan ut. Etiam viverra turpis sit amet maximus vulputate. Donec posuere lectus massa, nec vestibulum purus ultricies non. Praesent accumsan fringilla lacus et laoreet. Vivamus consectetur finibus elit, vel elementum tortor vulputate vitae."
            
        ))
    }
}
