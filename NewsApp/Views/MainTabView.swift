//
//  MainTabView.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 14/02/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NewsView()
            .tabItem {
                Label("All News", systemImage: "globe.americas.fill")
            }
            
            TechNewsView()
                .tabItem {
                    Label("Apple News", systemImage: "apple.logo")
                }
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
