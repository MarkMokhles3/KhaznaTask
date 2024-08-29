//
//  PostsAPIService.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 27/08/2024.
//

import Foundation

class PostsAPIService: PostsAPIServiceProtocol {
    
    func fetchPosts(page: Int, completion: @escaping (Result<[Post], Error>) -> Void)  {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/posts"
        components.queryItems = [
            URLQueryItem(name: "_page", value: "\(page)")
        ]
        
        let url = components.url?.absoluteString ?? ""
        
        APIService.sharedService.request(url: url, completion: completion)
    }
}
