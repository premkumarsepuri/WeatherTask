//
//	WeatherData.swift
//  Created by prem on 25/3/23.
//

import Foundation

struct WeatherData : Codable {

//	let base : String?
//	let clouds : Cloud?
//	let cod : Int?
//	let coord : Coord?
//	let dt : Int?
//	let id : Int?
	let main : Main?
	let name : String?
//	let sys : Sy?
//	let timezone : Int?
	let weather : [Weather]?
	let wind : Wind?


}
