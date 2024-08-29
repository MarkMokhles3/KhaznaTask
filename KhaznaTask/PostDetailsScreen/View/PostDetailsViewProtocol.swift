//
//  PostDetailsViewProtocol.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 29/08/2024.
//

import Foundation

protocol PostDetailsViewProtocol: AnyObject {
    func showPostDetails(title: String, body: String)
    func showLikeAnimation()
}
