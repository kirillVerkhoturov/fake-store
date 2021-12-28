//
//  Product.swift
//  Fake Store
//
//  Created by Anton Sobolev on 12/27/21.
//

import Foundation

struct Product: Codable {

    let id: Int
    let title: String
    let price: Double
    let category: String
    let description: String
    let image: String
}
