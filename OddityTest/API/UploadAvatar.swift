//
//  UploadAvatar.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/5.
//

import Foundation
import SwiftyJSON

extension NetworkManager {
    func uploadAvatar(_ imgData: Data,
                      completion: @escaping (Bool, String) -> ()) {
        
        let url = "/user/avatar"
        
        multipartDataUpload({ (multiData) in
            multiData.append(imgData, withName: "image", fileName: "image.png", mimeType: "image/png")
            // multiData.append("\(timestamp)".data(using: .utf8), withName: "Timestamp")
            // user id is mapped by Jwt in httpheader
            // timestamp is mapped by named "Timestamp"
        }, request: url) { (success, msg, data) in
            if success {
                let imageUrl = data.stringValue
                completion(true, imageUrl)
            } else {
                completion(false, "")
            }
        }
    }
}
