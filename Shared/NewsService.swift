//
//  NewsService.swift
//  NewsApp (iOS)
//
//  Created by Olya Levandivska on 17.03.2023.
//

import Foundation
import Alamofire


class NewsService {
    
    let newsUrlStr = "https://newsapi.org/v2/top-headlines?country=ua&apiKey=\(Constants.apiKey)"
    
    func fetchAllNews(completion: @escaping (Result<[New], Error>) -> Void) {
        
        guard let url = URL(string: newsUrlStr) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.missingData))
                return
            }
            
            print("data: \(String(data: data, encoding: .utf8))")
            
            do {
                // Parse the JSON data
                let res = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(res.articles))
            } catch (let error){
                completion(.failure(error))
            }
            
        }.resume()
    }
}

