//
//  PaletteList.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 3.9.24..
//

import SwiftUI

struct PaletteList: View {
    @EnvironmentObject private var store: PaletteStore
    
    var body: some View {
        NavigationStack {
            List(store.palettes) { palette in
                NavigationLink(value: palette) {
                    Text(palette.name)
                }
            }
            .navigationDestination(for: Palette.self) { palette in
                PaletteView(palette: palette)
            }
            .navigationTitle("\(store.name) Palette")
        }
    }
}

#Preview {
    PaletteList()
}
