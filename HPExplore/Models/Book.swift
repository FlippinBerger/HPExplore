//
//  Book.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

struct Book: Codable {
    var number: Int
    var title: String
    var releaseDate: String
    var description: String
    var pages: Int
    var cover: String
}
