//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import Foundation

struct EmojiArt {
    var background: URL?
    var emojis = [Emoji]()
    
    struct Emoji {
        let string: String
        var position: Position
        var size: Int
        
        struct Position {
            var x: Int
            var y: Int
        }
    }
}
