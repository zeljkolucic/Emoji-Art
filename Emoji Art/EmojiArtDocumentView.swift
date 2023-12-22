//
//  EmojiArtDocumentView.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import SwiftUI

struct EmojiArtDocumentView: View {
    private let emojis = ""
    
    var body: some View {
        VStack {
            Color.yellow
            ScrollingEmojis(emojis)
        }
    }
}

struct ScrollingEmojis: View {
    let emojis: [String]
    
    init(_ emojis: String) {
        self.emojis = emojis.uniqued.map(String.init)
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
    }
}

extension String {
    var uniqued: String {
        reduce(into: "") { partialResult, element in
            if !partialResult.contains(element) {
                partialResult.append(element)
            }
        }
    }
}

#Preview {
    EmojiArtDocumentView()
}
