//
//  Location.swift
//  BucketList
//
//  Created by Antonio Giroz on 27/11/25.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
    let description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static var example = Location(id: UUID(), name: "Málaga", description: "Some good description", latitude: 36.719444, longitude: -4.420000)
    #endif
}
