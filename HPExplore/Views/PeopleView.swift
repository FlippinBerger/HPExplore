//
//  PeopleView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct PeopleView: View {
    let vm = PeopleVM()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.people, id: \.fullName) {
                    PersonListItem(person: $0)
                        .listRowBackground(houseColorMap[$0.hogwartsHouse]!.primary)
                        .foregroundStyle(houseColorMap[$0.hogwartsHouse]!.secondary)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .task {
                do {
                    try await vm.getPeople()
                } catch {
                    print("Couldn't get the people")
                }
            }
            .background(bgColor)

        }
        
    }
}

struct PersonListItem: View {
    let person: Person
    @State var colors: HouseColors?
    
    var body: some View {
        Text(person.fullName)
            .font(.title)
            .fontWeight(.bold)
            .padding()
            .background(
                NavigationLink(destination: PersonDetailView(person: person)) {
                    EmptyView()
                }
                .opacity(0))
            .task {
                colors = houseColorMap[person.hogwartsHouse]
            }
    }
    
    
}

#Preview {
    PeopleView()
}
