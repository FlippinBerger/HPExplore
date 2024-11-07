//
//  TabSwitcher.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct TabSwitcher: View {
    var body: some View {
        TabView {
            Group {
                HousesView()
                    .tabItem{Label("", systemImage: "house")}
                PeopleView()
                    .tabItem{
                        Label("", systemImage: "person")
                    }
                BooksView()
                    .tabItem{
                        Label("", systemImage: "books.vertical")
                    }
                SpellsView()
                    .tabItem{
                        Label("", systemImage: "wand.and.sparkles")
                    }
            }
            .toolbarBackground(Color.black, for: .tabBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
        }
    }
}

#Preview {
    TabSwitcher()
}
