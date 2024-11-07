//
//  PeopleVM.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

@Observable
class PeopleVM {
    var people: [Person] = []
    
    func getPeople() async throws {
        let endpoint = "https://potterapi-fedeperin.vercel.app/en/characters"
        let url = URL(string: endpoint)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("bad response")
            return
        }
        
        do {
            people = try JSONDecoder().decode([Person].self, from: data)
        } catch {
            print("couldn't decode", error)
            return
        }
    }
    
    func getPeopleByHouse(_ house: String) async -> [Person] {
        if people.count == 0 {
            do {
                try await getPeople()
            } catch {
                print("couldn't get people", error)
                return []
            }
        }
        return people.filter { $0.hogwartsHouse == house }
    }
}
