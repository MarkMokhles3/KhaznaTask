//
//  PostsListPresenter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation

class PostsListPresenter: PostsListPresenterProtocol {
    
    var interactor: PostsListInteractorInputProtocol?
    weak var view: PostsListViewProtocol?
    var router: PostsListRouterProtocol?
    
    private var currentPage = 1
    private var isFetching = false
    private var hasMoreData: Bool = false  // Track if more data is available
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor?.fetchPosts(page: currentPage)
    }
    
    func loadMorePosts() {
        // Load more posts when user scrolls to the bottom
        guard !isFetching && hasMoreData  else { return }
        currentPage += 1
        interactor?.fetchPosts(page: currentPage)
    }
    
    func didPullToRefresh() {
        // Refresh posts with latest data
        currentPage = 1
        view?.clearPosts()
        interactor?.fetchPosts(page: currentPage)
    }
    private func fetchPosts() {
            isFetching = true
            interactor?.fetchPosts(page: currentPage)
        }
    
    func didSelectPost(post: Post) {
        router?.navigateToPostDetails(with: post)
    }
}


extension PostsListPresenter: PostsListInteractorOutputProtocol {
    
    func didFetchPosts(posts: [Post], isCached: Bool, hasMore: Bool) {
        isFetching = false
        self.hasMoreData = hasMore  // Update hasMoreData flag based on response
        view?.hideLoadingIndicator()
        
        print("Posts received in presenter: \(posts.count)")
        view?.displayPosts(posts, isCached: isCached)
        // in case no internet show error
        if isCached {
            // Handle the error
            view?.showError(message: "Failed to load posts. Please check your connection.")
        }
    }
    
    func didFailToFetchPosts(with error: String) {
        isFetching = false
        view?.hideLoadingIndicator()
        
        // Handle the error
        view?.showError(message: "Failed to load posts. Please check your connection.")
    }
}

