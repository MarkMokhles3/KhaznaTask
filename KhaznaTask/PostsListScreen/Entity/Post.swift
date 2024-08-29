//
//  Post.swift
//  KhaznaTask
//
//  Created by Mark Shafik on 26/08/2024.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

