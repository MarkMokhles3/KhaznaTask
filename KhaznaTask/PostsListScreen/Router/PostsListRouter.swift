//
//  PostsListRouter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import UIKit

class PostsListRouter: PostsListRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = PostsListViewController()
        let presenter = PostsListPresenter()
        let interactor = PostsListInteractor()
        let router = PostsListRouter()
        let dataSource = PostsAPIService()
        
        interactor.dataSource = dataSource
        view.presenter = presenter
        presenter.view = view 
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
    func navigateToPostDetails(with post: Post) {
        
    }
}

