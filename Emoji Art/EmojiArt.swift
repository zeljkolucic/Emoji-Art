//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import Foundation

struct EmojiArt {
    var background: URL?
    private(set) var emojis = [Emoji]()
    
    mutating func addEmoji(_ emoji: String, at position: Emoji.Position, size: Int) {
        emojis.append(Emoji(
            string: emoji,
            position: position,
            size: size
        ))
    }
    
    struct Emoji: Identifiable {
        let id = UUID()
        let string: String
        var position: Position
        var size: Int
        
        struct Position {
            var x: Int
            var y: Int
        }
    }
}
