//
//  EventModel.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-07.
//

import Foundation
import CoreLocation

struct EventModel: Identifiable, Codable {
    
    var id = UUID()
    var title: String
    var emoji: String
    var organizer: OrganizerModel
    var like_count: Int
    var headline: String
    var description: String
    var tags: [String] = []

    struct Location: Codable {
        var name: String
        var address: String
        var latitude: Double
        var longitude: Double
        
        init(name: String, address: String, coordinates: CLLocationCoordinate2D) {
            self.name = name
            self.address = address
            self.latitude = coordinates.latitude
            self.longitude = coordinates.longitude
        }
    }

    var location: Location
    var image: String?
    var date: Date
}
