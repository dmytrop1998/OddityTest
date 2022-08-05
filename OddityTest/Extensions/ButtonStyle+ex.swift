//
//  ButtonStyle+ex.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

struct AppButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: configuration.trigger) {
            configuration.label
                .padding()
                .font(.system(size: 17))
                .tint(.red)
                .frame(maxWidth: .infinity, maxHeight: 46)
                .foregroundColor(.blue)
                .background(Color.gray)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(uiColor: .red), lineWidth: 1))
                
        }
//        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Button") {}
            .buttonStyle(AppButtonStyle())
            .padding()
            .previewLayout(.fixed(width: 350, height: 100))
    }
}
