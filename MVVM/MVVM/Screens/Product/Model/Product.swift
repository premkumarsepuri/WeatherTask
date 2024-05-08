//
//  Product.swift
//  MVVM
//
//  Created by prem on 1/3/23.
//

import Foundation
struct Product: Codable {
    var id : Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image : String
    var rating: Rate
}
struct Rate: Codable {
    var rate: Float
    var count : Int
}
