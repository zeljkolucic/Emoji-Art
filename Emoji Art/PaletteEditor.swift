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
    @FocusState private var focused: Focused?
    
    enum Focused {
        case name
        case addEmojis
    }
    
    private let emojiFont = Font.system(size: 40)
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $palette.name)
                    .focused($focused, equals: .name)
            } header: {
                Text("Name")
            }
            Section {
                TextField("Add Emojis Here", text: $emojisToAdd)
                    .focused($focused, equals: .addEmojis)
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
        .onAppear {
            if palette.name.isEmpty {
                focused = .name
            } else {
                focused = .addEmojis
            }
        }
    }
    
    private var removeEmojis: some View {
        VStack(alignment: .trailing) {
            Text("Tap to Remove Emojis").font(.caption).foregroundStyle(.gray)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))]) {
                ForEach(palette.emojis.uniqued.map(String.init), id: \.self) { emoji in
                    Text(emoji)
                        .onTapGesture {
                            withAnimation {
                                palette.emojis.removeAll(where: { $0 == emoji.first! })
                                emojisToAdd.removeAll(where: { $0 == emoji.first! })
                            }
                        }
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
