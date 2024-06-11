//
//  CustomTextField.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    @Binding var value: Double
    var placeholder: String
    var foregroundColor: UIColor
    var font: UIFont
    @Binding var isActive: Bool

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.delegate = context.coordinator
        textField.textAlignment = .right
        textField.font = font
        textField.textColor = foregroundColor

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))

        toolbar.items = [flexSpace, doneButton]
        textField.inputAccessoryView = toolbar

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = "\(Int(value))"
        uiView.textColor = foregroundColor
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(_ parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isActive = true
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isActive = false
            if let text = textField.text, let newValue = Double(text) {
                parent.value = newValue
            }
        }

        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
