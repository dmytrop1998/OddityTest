//
//  LoginView.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var model = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 50) {
                TextField("Enter ID", text: $model.userId)
                    .textFieldStyle(AppTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("Enter")
                        .padding()
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .foregroundColor(model.userId.isEmpty ? .white : .black)
                        .background(model.userId.isEmpty ? .gray : .blue)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(uiColor: .red), lineWidth: 1))
                }
                .disabled(model.userId.isEmpty)

            }
            .padding()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
        /*
        // for ios 16.0
        NavigationStack {
            VStack(alignment: .center, spacing: 50) {
                TextField("Enter ID", text: $model.userId)
                    .textFieldStyle(AppTextFieldStyle())
                    .keyboardType(.decimalPad)
                
                NavigationLink(value: "Enter") {
                    Text("Enter")
                        .padding()
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity, maxHeight: 46)
                        .foregroundColor(model.userId.isEmpty ? .white : .black)
                        .background(model.userId.isEmpty ? .gray : .blue)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(uiColor: .red), lineWidth: 1))
                }
                .navigationDestination(for: String.self, destination: { s in
                    ProfileView()
                })
                .disabled(model.userId.isEmpty)
            }
            .padding()
        }
        */
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
