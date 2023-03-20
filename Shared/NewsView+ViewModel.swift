//
//  MainNewsView+ViewModel.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//

import Foundation

extension NewsView{
    class ViewModel: ObservableObject {
        
        @Published var savedNewsUrl: [String] {
            didSet{
                UserDefaults.standard.set(savedNewsUrl, forKey: Constants.savedNewUrlArrayKey)
            }
        }
                
        init(){
            self.savedNewsUrl = UserDefaults.standard.object(forKey: Constants.savedNewUrlArrayKey) as? [String] ?? [String]()
        }
        
        func newIsSaved(_ new: New) -> Bool{
            return savedNewsUrl.contains(new.url)
        }
        
        func removeNew(_ new: New){
            savedNewsUrl = savedNewsUrl.filter({$0 !=  new.url})
        }
        
        func saveNew(_ new: New){
            if !savedNewsUrl.contains(new.url){
                savedNewsUrl += [new.url]
            }
        }
    }
}
