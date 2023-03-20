//
//  NewCellView.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 18.03.2023.
//

import SwiftUI

struct NewCellView: View {
    
    let new: New
    
    var body: some View {
        VStack(alignment: .leading){
            if new.urlToImage != nil{
                AsyncImage(url: URL(string: new.urlToImage!)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                .frame(width: 300, height: 150, alignment: .leading)
            }

            Text(new.title)
                .font(.headline)
            Text(new.description ?? "")
                .font(.body)
            Text(new.publishedAt?.replacingOccurrences(of: "T", with: " ").replacingOccurrences(of: "Z", with: "") ?? "")
                    .font(.footnote)
        }
    }
}

struct NewCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewCellView(new: New(sourse: nil, author: "Author", title: "Title title title", description: "long desctiption text", url: "some url", urlToImage: nil, publishedAt: "11/03/2023 22:12"))
            .previewInterfaceOrientation(.landscapeLeft) }
}
