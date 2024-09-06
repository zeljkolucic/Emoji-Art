//
//  PaletteList.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 3.9.24..
//

import SwiftUI

struct EditablePaletteList: View {
    @ObservedObject var store: PaletteStore
    
    @State private var showCursorPalette = false
    
    var body: some View {
        List {
            ForEach(store.palettes) { palette in
                NavigationLink(value: palette.id) {
                    VStack(alignment: .leading) {
                        Text(palette.name)
                        Text(palette.emojis).lineLimit(1)
                    }
                }
            }
            .onDelete { indexSet in
                store.palettes.remove(atOffsets: indexSet)
            }
            .onMove { indexSet, newOffset in
                store.palettes.move(fromOffsets: indexSet, toOffset: newOffset)
            }
        }
        .navigationDestination(for: Palette.ID.self) { paletteId in
            if let index = store.palettes.firstIndex(where: { $0.id == paletteId }) {
                PaletteEditor(palette: $store.palettes[index])
            }
        }
        .navigationDestination(isPresented: $showCursorPalette) {
            PaletteEditor(palette: $store.palettes[store.cursorIndex])
        }
        .navigationTitle("\(store.name) Palette")
        .toolbar {
            Button {
                store.insert(name: "", emojis: "")
                showCursorPalette = true
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

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
