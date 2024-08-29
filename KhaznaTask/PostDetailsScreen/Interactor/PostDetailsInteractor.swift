//
//  PostDetailsInteractor.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 27/08/2024.
//

import Foundation

protocol PostDetailsInteractorInputProtocol: AnyObject {
    // Define any data-fetching or logic methods the presenter can call
}

protocol PostDetailsInteractorOutputProtocol: AnyObject {
    // Define methods for passing data back to the presenter (if needed)
}

class PostDetailsInteractor: PostDetailsInteractorInputProtocol {
    weak var presenter: PostDetailsInteractorOutputProtocol?

    // Any additional data-fetching or processing logic can be added here
}
