//
//  TextFieldStyle+ex.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

struct AppTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .stroke(Color.black, lineWidth: 1)
                    .background(Color(uiColor: .systemGray5)))
    }
}

