//
//  WebView.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/18/25.
//

import SwiftUI
import WebKit

/// Simple Webview to attach source url in detail view
struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        let request = URLRequest(url: url)
        wkwebView.load(request)
        return wkwebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
