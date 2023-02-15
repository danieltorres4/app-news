//
//  WebView.swift
//  NewsApp
//
//  Created by Iván Sánchez Torres on 15/02/23.
//

import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    let url: String
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: URL(string: url)!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
