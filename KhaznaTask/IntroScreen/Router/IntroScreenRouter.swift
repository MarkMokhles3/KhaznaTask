//
//  IntroScreenRouter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import UIKit

class IntroScreenRouter: IntroScreenRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> IntroScreenViewController {
        let view = IntroScreenViewController()
        let presenter = IntroScreenPresenter()
        let router = IntroScreenRouter()
        
        view.presenter = presenter
        presenter.router = router
        router.viewController = view
        
        return view
    }

    func navigateToPostsListScreen() {
        //TODO
    }
}
