//
//  BasicRequest.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//


import UIKit
import Alamofire

public struct BasicRequest: URLConvertible, CustomStringConvertible {
    
    public func asURL() throws -> URL {
        let urlString = APIController.buildUrlString(withEndpoint: self.endpoint, objectId: self.objectId, authenticationRequired: self.authenticationRequired)
        return URL(string: urlString)!
    }

    public init(endpoint: String, objectId: Int?, method: Alamofire.HTTPMethod?, authenticationRequired: Bool, parameters: [String: AnyObject]?) {
        self.endpoint = endpoint
        self.objectId = objectId
        self.method = method ?? .get
        self.authenticationRequired = authenticationRequired
        self.parameters = parameters
    }

    
    public var endpoint: String!
    public var objectId: Int!
    public var method = Alamofire.HTTPMethod.get
    public var authenticationRequired = false
    public var parameters: [String: AnyObject]?
    
    public var description: String {
        var printString = ""
        printString = printString + "url: \(try! self.asURL())"
        printString = printString +  "\nmethod: \(self.method)"
        if let params = self.parameters {
            printString = printString + "\nparams: \(params)"
        } else {
            print("Params Unused")
        }
        printString = printString +  "\nauthenticationRequired: \(self.authenticationRequired)"
        return printString
    }
}
