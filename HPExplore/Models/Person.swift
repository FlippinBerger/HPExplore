//
//  Person.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

struct Person: Codable, Hashable {
    var fullName: String
    var nickname:  String
    var hogwartsHouse: String
    var interpretedBy: String
    var children: [String]
    var image: String
    var birthdate: String // "Month Day, Year"
//    var id: Int
}
