//
//  NetworkManager.swift
//  OddityTest
//
//  Created by Good Developer on 2022/8/5.
//

import Foundation
import SwiftyJSON
import Alamofire

let baseUrl = "http://143.198.70.187:8340"
let jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwZXJtaXNzaW9ucyI6e30sImlhdCI6MTY1OTY1OTA2NiwiZXhwIjoxNzQ2MDU5MDY2LCJzdWIiOiI2MjhjOWFmMmE3Njg4MjAwMTM3NTg5N2UifQ.3sUH-9OHwg9Iszoty6VkJo4iyt5C-yq9GIahnC9TkO0"

final class NetworkManager {
    static let shared = NetworkManager()
    
    // MARK: - request
    func processRequest(_ request: String,
                        method: HTTPMethod,
                        params: [String: Any]? = nil,
                        completion: @escaping (_ success: Bool, _ message: String, _ data: JSON) -> ()) {
        
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(jwt)"))
        
        AF.request(baseUrl + request, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers ).responseData { (result) in
            if let _ = result.error {
                print(result.error.debugDescription)
                completion(false, result.error.debugDescription, JSON.null)
            } else {
                if let value = result.value {
                    let json = JSON(value)
                    
                    let resultSuccess = json["success"].boolValue
                    let message    = json["message"].stringValue
                    let result     = json["data"]
                    
                    if resultSuccess {
                        completion(resultSuccess, message, result)
                    } else {
                        completion(resultSuccess, message, JSON.null)
                    }
                }
            }
        }
    }
    
    func multipartDataUpload(_ multipartFormData: @escaping (MultipartFormData) -> Void,
                             request: String,
                             completion: @escaping (_ status: Bool, _ message: String, _ data: JSON) -> ()) {
        
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "Authorization", value: "Bearer \(jwt)"))
        
        AF.upload(multipartFormData: multipartFormData, to: baseUrl + request, headers: headers).responseData { (result) in
            
            if let error = result.error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription, JSON.null)
            } else {
                if let value = result.value {
                    let json = JSON(value)
                    
                    let resultSuccess = json["success"].boolValue
                    let message    = json["message"].stringValue
                    let result     = json["location"]
                    
                    if resultSuccess {
                        completion(resultSuccess, message, result)
                    } else {
                        completion(resultSuccess, message, JSON.null)
                    }
                }
            }
        }
    }
}
