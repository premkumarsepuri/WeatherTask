//
//  SearchResultModel.swift
//  Weather
//
//  Created by prem on 25/3/23.
//

import Foundation

struct SearchResultModel: Codable {
    let name: String?
    let lat: Double?
    let lon: Double?
    let country: String?
    let state: String?
}
