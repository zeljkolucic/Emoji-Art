//
//  CGOffset+.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 23.12.23..
//

import Foundation

typealias CGOffset = CGSize

extension CGOffset {
    static func +(lhs: CGOffset, rhs: CGOffset) -> CGOffset {
        CGOffset(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    static func +=(lhs: inout CGOffset, rhs: CGOffset) {
        lhs = lhs + rhs
    }
}
