//
//  IntroScreenPresenter.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation

class IntroScreenPresenter: IntroScreenPresenterProtocol {
    var router: IntroScreenRouterProtocol?

    func navigateToPostsList() {
        router?.navigateToPostsListScreen()
    }
}
