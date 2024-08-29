//
//  PostsListPresenterProtocol.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 29/08/2024.
//

import Foundation

protocol PostsListViewProtocol: AnyObject {
    func displayPosts(_ posts: [Post], isCached: Bool)
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func getCurrentPosts() -> [Post] // Method to get the current list of posts
    func clearPosts()
    func showError(message: String)
}

protocol PostsListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func loadMorePosts()
    func didPullToRefresh()
    func didSelectPost(post: Post)
}
