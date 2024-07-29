//
//  EventData.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-07.
//

import Foundation
import CoreLocation


struct EventData {
    
    static let organizers: [OrganizerModel] = [
        OrganizerModel(
            name: "UW Mathematics Society",
            bio: "A student-run organization for math lovers.",
            image: "mathsoc-logo",
            banner: "mathsoc-banner"
        ),
        OrganizerModel(
            name: "UW Computer Science Club",
            bio: "Coding, algorithms, and everything tech.",
            image: "cs-club-logo",
            banner: "mathsoc-banner"
        ),
    ]

    static let events: [EventModel] = [
        EventModel(
            title: "Math Competition",
            emoji: "🧮",
            organizer: organizers[0],
            like_count: 25,
            headline: "Put your math skills to the test!",
            description: "Join us for a friendly competition with challenging problems.",
            tags: ["math", "competition", "undergraduate"],
            location: EventModel.Location(name: "Mathematics 3", address: "200 University Ave W", coordinates: CLLocationCoordinate2D(latitude: 43.4723, longitude: -80.5449)),
            image: "math_competition.jpg",
            date: Date().addingTimeInterval(120)
        ),
        EventModel(
            title: "Hackathon 2024",
            emoji: "💻",
            organizer: organizers[1],
            like_count: 55,
            headline: "Build something awesome in 24 hours.",
            description: "Teams compete to create innovative software solutions.",
            tags: ["coding", "hackathon", "tech"],
            location: EventModel.Location(name: "Davis Centre", address: "200 University Ave W", coordinates: CLLocationCoordinate2D(latitude: 43.4709, longitude: -80.5406)),
            image: "hackathon.jpg",
            date: Date().addingTimeInterval(86400 * 14)
         )
    ]
}

