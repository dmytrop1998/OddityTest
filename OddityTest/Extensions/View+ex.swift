//
//  View+ex.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/5.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
