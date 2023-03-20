//
//  ContentView.swift
//  Shared
//
//  Created by Olya Levandivska on 17.03.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        TabView {
            NewsView(mode: .all, news: viewModel.news)
                .tabItem {
                    Label("Всі", systemImage: "list.dash")
                }

            NewsView(mode: .saved, news: viewModel.savedNews)
                .tabItem {
                    Label("Збережені", systemImage: "bookmark.fill")
                }.onAppear{
                    viewModel.updateSavedNews()
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
