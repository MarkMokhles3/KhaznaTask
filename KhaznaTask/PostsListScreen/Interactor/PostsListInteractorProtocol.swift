//
//  PostsListInteractorProtocol.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 29/08/2024.
//

import Foundation

protocol PostsListInteractorInputProtocol: AnyObject {
    func fetchPosts(page: Int)
    func fetchCachedPosts(posts: [Post])
}

protocol PostsListInteractorOutputProtocol: AnyObject {
    func didFetchPosts(posts: [Post], isCached: Bool, hasMore: Bool)
    func didFailToFetchPosts(with error: String)
}
