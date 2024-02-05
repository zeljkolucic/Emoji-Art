//
//  EmojiArt.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import Foundation

struct EmojiArt: Codable {
    var background: URL?
    private(set) var emojis = [Emoji]()
    
    func json() throws -> Data {
        try JSONEncoder().encode(self)
    }
    
    init(json: Data) throws {
        self = try JSONDecoder().decode(EmojiArt.self, from: json)
    }
    
    init() { }
    
    mutating func addEmoji(_ emoji: String, at position: Emoji.Position, size: Int) {
        emojis.append(Emoji(
            string: emoji,
            position: position,
            size: size
        ))
    }
    
    struct Emoji: Identifiable, Codable {
        let id: UUID
        let string: String
        var position: Position
        var size: Int
        
        init(string: String, position: Position, size: Int) {
            self.id = UUID()
            self.string = string
            self.position = position
            self.size = size
        }
        
        struct Position: Codable {
            var x: Int
            var y: Int
            
            static let zero = Self(x: 0, y: 0)
        }
    }
}
