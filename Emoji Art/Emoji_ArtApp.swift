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
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: defaultDocument)
        }
    }
}
