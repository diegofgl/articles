//
//  ArticlesViewModel.swift
//  Articles
//
//  Created by Scheila Gabriela Palharini Rodrigues on 13/09/22.
//

import Foundation

class ArticlesViewModel {
    static func getArticles(completion: @escaping (News) -> Void) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=b74cc1855f5946c2b578cbe57c8ce0d9")!
        
        URLSession.shared.dataTask(with: url) { data, responser, error in
            
            if let data = data {
                if let news = try? JSONDecoder().decode(News.self, from: data) {
                    completion(news)
                }
            }
        }.resume()
    }
}
