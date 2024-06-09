//
//  Restroom.swift
//  RestRoomFinder
//
//  Created by Takasur Home on 09/06/2024.
//

import Foundation

struct Restroom: Decodable, Identifiable {
    let id: Int
    let name: String?
    let street: String
    let city: String
    let state: String
    let accessible: Bool
    let unisex: Bool
    let directions: String?
    let comment: String?
    let latitude: Double
    let longitude: Double
    
    var addess: String {
        "\(street), \(city) \(state)"
    }
}
