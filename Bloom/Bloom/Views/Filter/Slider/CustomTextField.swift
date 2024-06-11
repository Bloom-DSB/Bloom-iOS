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

    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var value: Double

        init(value: Binding<Double>) {
            _value = value
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text?.replacingOccurrences(of: ",", with: ""),
               let newValue = Double(text) {
                value = newValue
            }
        }
        
        @objc func doneButtonTapped() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        textField.textAlignment = .right
        textField.borderStyle = .none
        textField.font = font
        textField.textColor = foregroundColor
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChangeSelection(_:)), for: .editingChanged)
        
        // Add toolbar with Done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: context.coordinator, action: #selector(Coordinator.doneButtonTapped))
        toolbar.setItems([UIBarButtonItem.flexibleSpace(), doneButton], animated: false)
        textField.inputAccessoryView = toolbar
        
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        if let formattedValue = formatter.string(from: NSNumber(value: value)) {
            uiView.text = formattedValue
        }
    }
}
