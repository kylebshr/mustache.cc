//
//  File.swift
//  
//
//  Created by Kyle Bashour on 10/24/19.
//

import Foundation

struct Ride: Codable {
    let date: Date
    let title: String
    let location: String
    let miles: Int
    let elevation: Int
    let difficulty: String
    let description: String
    let imageName: String
    let link: URL
}
