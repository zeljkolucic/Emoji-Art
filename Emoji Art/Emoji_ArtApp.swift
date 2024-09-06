//
//  Emoji_ArtApp.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import SwiftUI

@main
struct Emoji_ArtApp: App {
    @StateObject var defaultDocument = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "Main")
    
    var body: some Scene {
        WindowGroup {
//            PaletteManager(stores: [paletteStore])
            EmojiArtDocumentView(document: defaultDocument)
                .environmentObject(paletteStore)
        }
    }
}
