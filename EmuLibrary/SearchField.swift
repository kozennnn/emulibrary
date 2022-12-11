//
//  SearchField.swift
//  EmuLibrary
//
//  Created by Mathis HOUIS on 10/12/2022.
//

import SwiftUI

/// A wrapper around NSSearchField so we get a macOS-native search box
struct SearchField: NSViewRepresentable {
    /// The text entered by the user.
    @Binding var text: String

    /// Placeholder text for the text field.
    let prompt: String
    let height: Int

    init(_ prompt: String, height: Int, text: Binding<String>) {
        self.prompt = prompt
        self.height = height
        _text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(binding: $text)
    }

    func makeNSView(context: Context) -> NSSearchField {
        let tf = NSSearchField(string: text)
        tf.placeholderString = prompt
        tf.delegate = context.coordinator
        tf.bezelStyle = .roundedBezel
        //tf.focusRingType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(greaterThanOrEqualToConstant: CGFloat(height)).isActive = true
        tf.controlSize = NSControl.ControlSize.large
        return tf
    }

    func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.stringValue = text
    }

    class Coordinator: NSObject, NSSearchFieldDelegate {
        let binding: Binding<String>

        init(binding: Binding<String>) {
            self.binding = binding
            super.init()
        }

        func controlTextDidChange(_ obj: Notification) {
            guard let field = obj.object as? NSTextField else { return }
            binding.wrappedValue = field.stringValue
        }
    }
}
