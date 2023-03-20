//
//  DetailsNewView.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//

import SwiftUI

struct DetailsNewView: View {
    
    let urlStr: String
    @ObservedObject var viewModel: ViewModel
    
    init(urlStr: String){
        self.urlStr = urlStr
        self.viewModel = ViewModel()
        if let url = URL(string: urlStr){
            self.viewModel.url = url
        }
    }
    
    var body: some View {
        VStack{
            WebView(webView: viewModel.webView)
        }
    }
}

//struct DetailsNewView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsNewView()
//    }
//}

