//
//  String+uniqued.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 22.12.23..
//

import Foundation

extension String {
    var uniqued: String {
        reduce(into: "") { partialResult, element in
            if !partialResult.contains(element) {
                partialResult.append(element)
            }
        }
    }
}
