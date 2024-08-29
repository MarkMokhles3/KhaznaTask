//
//  PostsAPIServiceProtocol.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 27/08/2024.
//

import Foundation

protocol PostsAPIServiceProtocol{
    func fetchPosts(page: Int, completion: @escaping (Result<[Post], Error>) -> Void) 
}

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

