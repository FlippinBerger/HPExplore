//
//  HousesView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

let hufflepuff = "Hufflepuff"
let slytherin = "Slytherin"
let gryffindor = "Gryffindor"
let ravenclaw = "Ravenclaw"

struct HousesView: View {
    var vm = HouseVM()
    
    var body: some View {
        NavigationStack {
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                GridRow(alignment: .center) {
                    NavigationLink {
                        HouseView(house: vm.houseMap[hufflepuff])
                    } label: {
                        Text("Hufflepuff")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(HufflepuffColors.primary)
                            .foregroundStyle(HufflepuffColors.secondary)
                            .font(.largeTitle)
                    }
                    NavigationLink {
                        HouseView(house: vm.houseMap[slytherin])
                    } label: {
                        Text("Slytherin")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(SlytherinColors.primary)
                            .foregroundStyle(SlytherinColors.secondary)
                            .font(.largeTitle)
                    }
                }.gridColumnAlignment(.center)
                GridRow(alignment: .center) {
                    NavigationLink {
                        HouseView(house: vm.houseMap[gryffindor])
                    } label: {
                        Text("Griffyndor")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(GryffindorColors.primary)
                            .foregroundStyle(GryffindorColors.secondary)
                            .font(.largeTitle)
                    }
                    NavigationLink {
                        HouseView(house: vm.houseMap[ravenclaw])
                    } label: {
                        Text("Ravenclaw")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(RavenclawColors.primary)
                            .foregroundStyle(RavenclawColors.secondary)
                            .font(.largeTitle)
                    }
                }.gridColumnAlignment(.center)
            }
        }
        .task {
            do {
                try await vm.getHouses()
            } catch {
                print("couldnt get the houses", error)
            }
        }
    }
}

#Preview {
    HousesView()
}
