//
//  SpellsView.swift
//  HPExplore
//
//  Created by Chris Berger on 11/4/24.
//

import SwiftUI

struct SpellsView: View {
    private let vm = SpellVM()
    @State var spell: Spell?
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                if let spell {
                    VStack {
                        Text(spell.spell)
                            .font(.largeTitle)
                            .foregroundStyle(.indigo)
                            .fontWeight(.bold)
                            .padding(.bottom, 24)
                        Text(spell.use)
                            .font(.title)
                    }
                    .padding()
                }
                Spacer()
                Button("Get Spell") {
                    Task {
                        spell = try await vm.randomSpell()
                    }
                }
                .padding(16)
                .foregroundStyle(.white)
                .buttonStyle(.bordered)
                .background(Color.indigo)
                .clipShape(.rect(cornerRadius: 80))
                .font(.title)
            }
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}

#Preview {
    SpellsView()
}
