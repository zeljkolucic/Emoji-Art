//
//  PaletteEditor.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 2.9.24..
//

import SwiftUI

struct PaletteEditor: View {
    @Binding var palette: Palette
    
    @State private var emojisToAdd: String = ""
    
    private let emojiFont = Font.system(size: 40)
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $palette.name)
            } header: {
                Text("Name")
            }
            Section {
                TextField("Add Emojis Here", text: $emojisToAdd)
                    .font(emojiFont)
                    .onChange(of: emojisToAdd) { emojisToAdd in
                        palette.emojis = (emojisToAdd + palette.emojis).filter { $0.isEmoji }.uniqued
                    }
                removeEmojis
            } header: {
                Text("Emojis")
            }
        }
        .frame(minWidth: 300, minHeight: 350)
    }
    
    private var removeEmojis: some View {
        VStack(alignment: .trailing) {
            Text("Tap to Remove Emojis").font(.caption).foregroundStyle(.gray)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
        .font(emojiFont)
    }
}
//
//#Preview {
//    PaletteEditor()
//}
