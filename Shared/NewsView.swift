//
//  MainNewsView.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 17.03.2023.
//

import SwiftUI
import Combine

struct NewsView: View {
    
    enum Mode {
        case all, saved
    }
    
    @ObservedObject var viewModel = ViewModel()
    @State private var searchText = ""

    let mode: Mode
    let news: [New]
    
    var body: some View {
        VStack{
            NavigationView {
                ScrollView{
                    VStack {
                        ForEach(searchResults , id: \.self) { new in
                            VStack(alignment: .leading){
                                HStack{
                                    NewCellView(new: new)
                                        .frame(maxWidth:  .infinity, alignment: .leading)
                                    
                                    VStack{
                                        if mode == .all{
                                            Button(action: {
                                                if viewModel.newIsSaved(new) {
                                                    viewModel.removeNew(new)
                                                }else {
                                                    viewModel.saveNew(new)
                                                }
                                            }, label: {
                                                Image(systemName: viewModel.newIsSaved(new) ? "bookmark.fill" : "bookmark")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: 20)
                                                    .foregroundColor(.black)
                                            })
                                        }
                                        Spacer()
                                        NavigationLink {
                                            DetailsNewView(urlStr: new.url)
                                        } label: {
                                            Image(systemName: "chevron.right")
                                        }
                                        Spacer()
                                    }
                                    
                                }.padding()
                                    .frame(width: UIScreen.main.bounds.width)
                                
                                if news.last != new{
                                    Divider()
                                }
                            }.frame(alignment: .leading)
                        }
                    }
                }.navigationTitle(mode == .all ? "Новини" : "Збережені")
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Пошук")

        }
    }
    
    var searchResults: [New] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { $0.title.contains(searchText) }
        }
    }
}


//struct MainNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainNewsView()
//    }
//}
