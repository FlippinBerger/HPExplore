//
//  BooksView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

//var number: Int
//var title: String
//var releaseDate: Date
//var description: String
//var pages: Int
//var cover: String

struct BooksView: View {
    private var vm = BookVM()
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 32) {
                    ForEach(vm.books, id: \.number) {
                        BookCover(book: $0)
                    }
                }
                .padding()
                .task {
                    do {
                        try await vm.getBooks()
                    } catch {
                        print("Couldn't get books", error)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(bgColor)
        }
    }
}

struct BookCover: View {
    var book: Book
    
    var body: some View {
        NavigationLink {
            BookDetailView(book: book)
        } label: {
            AsyncImage(url: URL(string: book.cover))
        }
    }
}

#Preview {
    BooksView()
}
