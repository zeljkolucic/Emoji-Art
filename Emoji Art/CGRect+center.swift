//
//  CGRect+center.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import Foundation

extension CGRect {
    var center: CGPoint {
        CGPoint(x: midX, y: midY)
    }
    
    init(center: CGPoint, size: CGSize) {
        self.init(origin: CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2), size: size)
    }
}
