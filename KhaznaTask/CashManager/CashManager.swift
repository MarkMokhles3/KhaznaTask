//
//  CashManager.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 27/08/2024.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()

    private let cacheKey = "cachedPosts"

    // Save posts to cache
    func cachFetchedPosts(posts: [Post]) {
        if let data = try? JSONEncoder().encode(posts) {
            UserDefaults.standard.set(data, forKey: cacheKey)
        }
    }

    // Retrieve posts from cache
    func getCachedPosts() -> [Post]? {
        if let data = UserDefaults.standard.data(forKey: cacheKey),
           let posts = try? JSONDecoder().decode([Post].self, from: data) {
            return posts
        }
        return nil
    }
}
