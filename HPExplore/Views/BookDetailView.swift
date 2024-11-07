//
//  BookDetailView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct BookDetailView: View {
    var book: Book
    
    let c = Color(red: 0.88, green: 0.97, blue: 0.86)

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(book.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.trailing, .leading], 8)
                Text("Book \(book.number)")
                    .font(.title)
                    .padding()
                AsyncImage(url: URL(string: book.cover))
                Text(book.releaseDate)
                    .font(.title)
                ZStack {
                    VStack {
                        Text(book.description)
                            .font(.title)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(c)
                                .shadow(color: Color.gray, radius: 2)
                            )
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(bgColor)
    }
}

