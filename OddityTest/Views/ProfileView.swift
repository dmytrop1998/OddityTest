//
//  ProfileView.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject private var model = ProfileViewModel()
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                CircleImage(image: model.profileImage ?? Image(systemName: "person.circle"))
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                
                Button {
                    model.isConfirmationPresented = true
                } label: {
                    Image(systemName: "plus.circle")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4))
                }
                .confirmationDialog("Choose an option", isPresented: $model.isConfirmationPresented) {
                    Button {
                        model.isPresentedCamera = true
                    } label: {
                        Text("Take Photo")
                    }
                    
                    Button {
                        model.isPresentedImagePicker = true
                    } label: {
                        Text("Photo Library")
                    }
                }
                .onChange(of: model.inputUIImage) { _ in model.loadImage() }
                .fullScreenCover(isPresented: $model.isPresentedCamera) {
                    ImagePicker(image: $model.inputUIImage, sourceType: .camera)
                }
                .fullScreenCover(isPresented: $model.isPresentedImagePicker) {
                    ImagePicker(image: $model.inputUIImage, sourceType: .photoLibrary)
                }
            }
            
            Button {
                model.checkValid()
            } label: {
                if model.isLoading {
                    HStack {
                        ProgressView().progressViewStyle(.circular)
                            .padding(.horizontal)
                        Text("Uploading...")
                    }
                } else {
                    Text("Upload")
                }
            }
            .padding(.top)
            .foregroundColor(model.profileImage == nil ? .gray : .blue)
            .disabled(model.profileImage == nil)
            .alert(item: $model.errorAlert) { item in
                Alert(title: Text("Notice!"), message: Text(item.message), dismissButton: .default(Text("OK")))
            }
            .onChange(of: model.isSucceeded) { isSucceeded in
                if isSucceeded {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
