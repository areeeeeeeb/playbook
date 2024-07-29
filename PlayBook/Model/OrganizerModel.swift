//
//  OrganizerModel.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-07.
//

import Foundation

struct OrganizerModel: Identifiable, Codable  {
    var id = UUID()
    var name: String
    var bio: String
    var image: String
    var banner: String
}
