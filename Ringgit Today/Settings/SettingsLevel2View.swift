//
//  SettingsLevel2View.swift
//  Ringgit Today
//
//  Created by Mah Jun Wei on 04/03/2020.
//  Copyright © 2020 Mah Jun Wei. All rights reserved.
//

import SwiftUI

struct SettingsLevel2View: View {
    var rows: [String] = []
    var title: String = ""
    let urlPrivacyPolicy = Bundle.main.url(forResource: "privacy_policy", withExtension: "html")
    let urlAPI = URL(string: "https://exchangeratesapi.io/")
    let urlIcon = URL(string: "https://www.flaticon.com/")

    var body: some View {
        Form() {
            ForEach(rows, id: \.self) { title in
                NavigationLink(destination: self.destination(for: title)) {
                    Text(title)
                }
            }
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
    }
    
    private func destination (for setting: String) -> WebView {
        if setting == "Privacy Policy" {
            return WebView(request: URLRequest(url: self.urlPrivacyPolicy!))
        } else if (setting == "API by") {
            return WebView(request: URLRequest(url: self.urlAPI!))
        } else {
            return WebView(request: URLRequest(url: self.urlIcon!))
        }
    }

}

import WebKit
struct WebView : UIViewRepresentable {
      
    let request: URLRequest
      
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
      
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
      
}
