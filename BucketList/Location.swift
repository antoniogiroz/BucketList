//
//  Location.swift
//  BucketList
//
//  Created by Antonio Giroz on 27/11/25.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
}
