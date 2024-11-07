//
//  Colors.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation
import SwiftUI

struct HouseColors {
    var primary: Color
    var secondary: Color
}

let GryffindorColors: HouseColors = .init(
    primary: Color(red: 0.45, green: 0,  blue: 0.0039),
    secondary: Color(red: 0.82, green: 0.65, blue: 0.14)
)
let RavenclawColors: HouseColors = .init(
    primary: Color(red: 0.05, green: 0.1,  blue: 0.25),
    secondary: Color(red: 0.745, green: 0.745, blue: 0.745)
)
let HufflepuffColors: HouseColors = .init(
    primary: Color(red: 0.92, green: 0.72,  blue: 0.22),
    secondary: Color(red: 0.21, green: 0.18, blue: 0.16)
)
let SlytherinColors: HouseColors = .init(
    primary: Color(red: 0.1, green: 0.28,  blue: 0.16),
    secondary: Color(red: 0.666, green: 0.666, blue: 0.666)
)

let houseColorMap: [String: HouseColors] = [
    hufflepuff: HufflepuffColors,
    gryffindor: GryffindorColors,
    ravenclaw: RavenclawColors,
    slytherin: SlytherinColors
]

let bgColor = Color(red: 0.98, green: 0.90, blue: 0.89)
