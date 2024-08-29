//
//  PostDetailsPresenter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation

class PostDetailsPresenter: PostDetailsPresenterProtocol {
    weak var view: PostDetailsViewProtocol?
    var interactor: PostDetailsInteractorInputProtocol?
    var router: PostDetailsRouterProtocol?
    
    private let post: Post
    
    init(post: Post, view: PostDetailsViewProtocol, interactor: PostDetailsInteractorInputProtocol, router: PostDetailsRouterProtocol) {
        self.post = post
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        // Provide the post details to the view
        view?.showPostDetails(title: post.title, body: post.body)
    }
    
    func likeButtonTapped() {
        // Handle the like button tap and show the animation
        view?.showLikeAnimation()
    }
}
