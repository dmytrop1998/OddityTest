//
//  ProfilewViewModel.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/4.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @Published var isConfirmationPresented = false
    @Published var isPresentedCamera = false
    @Published var isPresentedImagePicker = false
    @Published var inputUIImage: UIImage?
    @Published var profileImage: Image?
    
    @Published var isLoading = false
    @Published var isImageUploading = false
    @Published var errorAlert: AlertItem?
    @Published var isSucceeded = false
    
    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        profileImage = Image(uiImage: inputUIImage)
        // save image to photo library
        UIImageWriteToSavedPhotosAlbum(inputUIImage, nil, nil, nil)
    }
    
    func checkValid() {
        
        if profileImage == nil {
            errorAlert = AlertItem(message: "Add your image.")
            return
        }
        
        uploadImage()
    }
    
    fileprivate func uploadImage() {
        isLoading = true
        guard let image = inputUIImage else { return }
        NetworkManager.shared.uploadAvatar(image.jpegData(compressionQuality: 0.2)!) { success, photoURL in
            DispatchQueue.main.async { [self] in
                isLoading = false
                if success {
                    isSucceeded = true
                    print("Uploaded Image Url: ", photoURL)
                } else {
                    isSucceeded = false
                    errorAlert = AlertItem(message: "Server error. Try later")
                }
            }
        }
    }
    
}

struct AlertItem: Identifiable {
    var id = UUID()
    var message: String
}
