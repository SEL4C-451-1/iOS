//
//  Activity.swift
//  SEL4C
//
//  Created by Moisés Adame Aguilar on 22/09/23.
//

import Foundation

struct Activity: Codable {
    var activityName: String
    var activityNumber: String
    var subactivities: [Subactivity]
}

struct Subactivity: Codable {
    var subactivityName: String
    var instructions: Instructions
    var deliverable: String
}

struct Instructions: Codable {
    var text: String
    var bullets: [String]
}
