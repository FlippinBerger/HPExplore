//
//  BookVM.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import Foundation

@Observable
class BookVM {
    var books: [Book] = []
    
    func getBooks() async throws {
        let endpoint = "https://potterapi-fedeperin.vercel.app/en/books"
        let url = URL(string: endpoint)!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("bad response", response)
            return
        }
        
        do {
            books = try JSONDecoder().decode([Book].self, from: data)
        } catch {
            print("Couldn't decode books", error)
            return
        }
    }
}
