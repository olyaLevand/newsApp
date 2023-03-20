//
//  ContentView+ViewModel.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//

import Foundation

extension ContentView{
    class ViewModel: ObservableObject {
        
        @Published var news: [New] = []
        @Published var savedNews: [New] = []
        @Published var savedNewsUrl: [String] {
            didSet{
                UserDefaults.standard.set(savedNewsUrl, forKey: Constants.savedNewUrlArrayKey)
            }
        }
        
        let newsService = NewsService()
        
        init(){
            self.savedNewsUrl = UserDefaults.standard.object(forKey: Constants.savedNewUrlArrayKey) as? [String] ?? [String]()
            print("savedArray \(savedNewsUrl)")
            fetchNews()
        }
        
        func fetchNews(){
            newsService.fetchAllNews(completion: { [weak self] result in
                switch result {
                case .success(let news):
                    DispatchQueue.main.async { [weak self] in
                        self?.news = news
                        self?.updateSavedNews()
                    }
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            })
        }
        
        func updateSavedNews() {
            self.savedNewsUrl = UserDefaults.standard.object(forKey: Constants.savedNewUrlArrayKey) as? [String] ?? [String]()
            self.savedNews = self.news.filter{ savedNewsUrl.contains( $0.url ) }
        }
    }
}
