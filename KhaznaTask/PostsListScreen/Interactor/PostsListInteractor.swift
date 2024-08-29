//
//  PostsListInteractor.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation

class PostsListInteractor: PostsListInteractorInputProtocol {
    var presenter: PostsListInteractorOutputProtocol?
    var dataSource: PostsAPIServiceProtocol?
    
    func fetchCachedPosts(posts: [Post]) {
        CacheManager.shared.cachFetchedPosts(posts: posts)
    }
    
    func fetchPosts(page: Int) {
        dataSource?.fetchPosts(page: page) { [weak self] result in
            switch result {
                
            case .success(let posts):
                
                // Check if there are more posts to fetch
                let hasMore = posts.count == 10
                
                // Save data to cache
                self?.fetchCachedPosts(posts: posts)
                self?.presenter?.didFetchPosts(posts: posts, isCached: false, hasMore: hasMore)
                
            case .failure(let error):
                // On failure, try loading cached data
                if let cachedPosts = CacheManager.shared.getCachedPosts() {
                    self?.presenter?.didFetchPosts(posts: cachedPosts, isCached: true, hasMore: false)
                } else {
                    self?.presenter?.didFailToFetchPosts(with: error.localizedDescription)
                }
            }
        }
    }
}
