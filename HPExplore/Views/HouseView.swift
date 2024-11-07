//
//  HouseView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct HouseView: View {
    let house: House?
    @State var importantPeople: [Person] = []
    @State private var colors: HouseColors?
    
    let vm = PeopleVM()
    
    var body: some View {
        if let house {
            NavigationStack {
                VStack {
                    HStack {
                        Text(house.house)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(house.emoji)
                            .font(.largeTitle)
                    }
                    .padding(.bottom, 16)
                    Text("Founder: \(house.founder)")
                        .font(.title)
                        .padding(.bottom, 16)
                    List {
                        Section {
                            ForEach(importantPeople, id: \.fullName) {
                                PersonListItem(person: $0)
                            }
                            .listRowSeparator(.hidden)
                        } header: {
                            Text("Notable characters")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .listRowBackground(colors?.primary ?? Color.white)
                    }
                    .scrollContentBackground(.hidden)
                    .listRowBackground(colors?.primary ?? Color.red)
                    .navigationDestination(for: Person.self) {
                        PersonDetailView(person: $0)
                    }
                    .task {
                        colors = houseColorMap[house.house]
                        importantPeople = await vm.getPeopleByHouse(house.house)
                    }
                }
                
            }
            .background(colors?.primary ?? Color.white)
            .foregroundStyle(colors?.secondary ?? Color.black)
        }
    }
}
