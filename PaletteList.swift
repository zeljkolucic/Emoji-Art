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
        List(store.palettes) { palette in
            Text(palette.name)
        }
    }
}

#Preview {
    PaletteList()
}
