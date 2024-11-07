//
//  PersonDetailView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct PersonDetailView: View {
    let person: Person
    @State var colors: HouseColors?
    
    var body: some View {
        VStack {
            Text(person.fullName)
                .font(.largeTitle)
            AsyncImage(url: URL(string: person.image))
                .clipShape(Ellipse())
            Text(person.hogwartsHouse)
                .font(.title)
            Text("Birthday: \(person.birthdate)")
                .font(.title)
            Text("Played by \(person.interpretedBy)")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colors?.primary ?? Color.white)
        .foregroundStyle(colors?.secondary ?? Color.black)
        .task {
            colors = houseColorMap[person.hogwartsHouse]
        }
    }
}
//#Preview {
//    PersonDetailView()
//}
