//
//  UndoButton.swift
//  Emoji Art
//
//  Created by Zeljko Lucic on 8.9.24..
//

import SwiftUI

struct UndoButton: View {
    @Environment(\.undoManager) var undoManager
    
    @State private var showUndoMenu = false
    
    var body: some View {
        if let undoManager {
            Image(systemName: "arrow.uturn.backward.circle")
                .foregroundColor(.accentColor)
                .onTapGesture {
                    undoManager.undo()
                }
                .onLongPressGesture(minimumDuration: 0.05) {
                    showUndoMenu = true
                }
                .popover(isPresented: $showUndoMenu) {
                    VStack {
                        if !undoManager.canUndo, !undoManager.canRedo {
                            Text("Nothing to Undo")
                        } else {
                            if undoManager.canUndo {
                                Button("Undo " + undoManager.undoActionName) {
                                    undoManager.undo()
                                    showUndoMenu = false
                                }
                            }
                            if undoManager.canRedo {
                                if undoManager.canUndo {
                                    Divider()
                                }
                                Button("Redo " + undoManager.redoActionName) {
                                    undoManager.redo()
                                    showUndoMenu = false
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: 280)
                }
        }
    }
}
