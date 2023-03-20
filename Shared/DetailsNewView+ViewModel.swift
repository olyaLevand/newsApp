//
//  DetailsNewViewModel.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//

import SwiftUI
import WebKit

extension DetailsNewView {
    class ViewModel: ObservableObject {
        let webView: WKWebView
        var url: URL? {
            didSet{
                loadUrl()
            }
        }
        
        init() {
            webView = WKWebView(frame: .zero)
        }
        
        func loadUrl() {
            guard url != nil else { return }
            webView.load(URLRequest(url: url!))
        }
    }
}

