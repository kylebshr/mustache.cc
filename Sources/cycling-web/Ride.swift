//
//  File.swift
//  
//
//  Created by Kyle Bashour on 10/24/19.
//

import Foundation

struct Ride: Codable {
    let date: String
    let title: String
    let time: String
    let location: String
    let distance: Int
    let elevation: Int
    let difficulty: String
    let description: String
    let imageName: String
}
