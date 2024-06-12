//
//  HomeSearchTextField.swift
//  Bloom
//
//  Created by 조다은 on 6/10/24.
//

import SwiftUI
import UIKit

struct HomeSearchTextField: UIViewRepresentable {
    @Binding var text: String
    var onCommit: () -> Void

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: HomeSearchTextField

        init(parent: HomeSearchTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit()
            textField.resignFirstResponder()
            return true
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "소중한 사람에게 장미를🌹"
        textField.delegate = context.coordinator
        textField.returnKeyType = .search
        textField.backgroundColor = UIColor.systemGray6
        textField.borderStyle = .none
        textField.layer.cornerRadius = 8
        textField.font = UIFont(name: "Pretendard-Regular", size: 15)
        textField.leftViewMode = .always

        let iconView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        iconView.tintColor = .black

        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        containerView.addSubview(iconView)
        containerView.addSubview(spacerView)

        iconView.center = CGPoint(x: 23, y: 10)
        textField.leftView = containerView

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}
