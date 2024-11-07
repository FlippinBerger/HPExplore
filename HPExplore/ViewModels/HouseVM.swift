//
//  HouseVM.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

@Observable
class HouseVM {
    var houses: [House] = []
    var houseMap: [String: House] = [:]
    
    func getHouses() async throws {
        let endpoint = "https://potterapi-fedeperin.vercel.app/en/houses"
        let url = URL(string: endpoint)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("bad response")
            return
        }
        
        do {
            houses = try JSONDecoder().decode([House].self, from: data)
            for house in houses {
                houseMap[house.house] = house
            }
        } catch {
            print("couldn't decode", error)
            return
        }
    }
}
