//
//  PostDetailsRouter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import UIKit

class PostDetailsRouter: PostDetailsRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule(with post: Post) -> PostDetailsViewController {
        let view = PostDetailsViewController()
        let interactor = PostDetailsInteractor()
        let router = PostDetailsRouter()
        let presenter = PostDetailsPresenter(post: post, view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter as? PostDetailsInteractorOutputProtocol
        router.viewController = view

        return view
    }
}

