//
//  PaletteChooser.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 23.12.23..
//

import SwiftUI

struct PaletteChooser: View {
    @EnvironmentObject var store: PaletteStore
    
    var body: some View {
        HStack {
            chooser
            view(for: store.palettes[store.cursorIndex])
        }
    }
    
    var chooser: some View {
        Button {
            store.cursorIndex += 1
        } label: {
            Image(systemName: "paintpalette")
        }
    }
    
    func view(for palette: Palette) -> some View {
        HStack {
            Text(palette.name)
            ScrollingEmojis(palette.emojis)
        }
    }
}

#Preview {
    PaletteChooser()
        .environmentObject(PaletteStore(named: "Preview"))
}
