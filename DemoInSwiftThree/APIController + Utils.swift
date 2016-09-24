//
//  APIController + Utils.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//


import Foundation
import Alamofire

public extension APIController {
    static func showNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    static func hideNetworkActivity() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

public extension DataResponse {
    func responsePayload() -> Dictionary<String, AnyObject>? {
        guard let json = self.result.value as? Dictionary<String, AnyObject> else {
            return nil
        }
        guard let responsePayload = json["response_payload"] as? Dictionary<String, AnyObject> else {
            return nil
        }
        return responsePayload
    }
}
