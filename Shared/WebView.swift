//
//  WebView.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//


import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView

    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}
