//
//  SpellViewModel.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

@Observable
class SpellVM {
    var spells: [Spell] = []
    
    private var lastSpellIndex: Int?
    
    func getSpells() async throws {
        let endpoint = "https://potterapi-fedeperin.vercel.app/en/spells"
        let url = URL(string: endpoint)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            return
        }
       
        do {
            spells = try JSONDecoder().decode([Spell].self, from: data)
        } catch {
            print("couldn't decode the spells", error)
            return
        }
    }
    
    func randomSpell() async throws -> Spell? {
        if spells.count == 0 {
            do {
                try await getSpells()
            } catch {
                print("couldn't fetch the spells", error)
                return nil
            }
        }
        var index = Int.random(in: 0..<spells.count)
        
        while index == lastSpellIndex {
            index = Int.random(in: 0..<spells.count)
        }
            
        lastSpellIndex = index
        return spells[index]
    }
}
