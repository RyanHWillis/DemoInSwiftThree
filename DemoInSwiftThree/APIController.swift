//
//  APIController.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//


import Foundation
import Alamofire

//MARK: Callback typealiases

public typealias SuccessCompletion = (_ response: DataResponse<Any>) -> ()
public typealias FailureCompletion = (_ response: DataResponse<Any>) -> ()

//MARK: - APIController

public struct APIController {
    
    //MARK: - Definitions
    
    //MARK: Constants
    static let baseUrl = "http://pastebin.com/"
    static let versionName = "raw/"
    static var versionedBaseUrlString: String {
        return APIController.baseUrl + APIController.versionName
    }
    
    //MARK: Session
    
    let session = URLSession.shared
    
    //MARK: Token
    
    public static var token: String!
    
    //MARK: - Central network request method
    
    /**
     Executes a network request using provided BasicRequest information via Alamofire
     */
    
    static public func execute(request: BasicRequest, success: @escaping SuccessCompletion, failure: FailureCompletion?) {
        self.printMessage(text: "Performing Alamofire request...")
        print(request)
        APIController.showNetworkActivity()

        Alamofire.request(request, method: request.method, parameters: request.parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response: DataResponse<Any>) in
            
            APIController.hideNetworkActivity()
            guard self.validateSession(response: response) else {
                return
            }
            if response.result.isSuccess {
                self.printMessage(text: "Alamofire request completed successfully with response:")
                print(response)
                success(response)
            } else {
                self.printMessage(text: "Alamofire request failed with response:")
                print(response)
                failure?(response)
            }
        }
    }
    
    //MARK: - Validate session
    
    /**
     Checks for invalid token errors from the API - If token is expired then logout the current user
     */
    
    static func validateSession(response: DataResponse<Any>) -> Bool {
        
        // HERE I WOULD VALIDATE THE SESSION BY CHECKING RESPPONSE_PAYLOAD AND CHECKING UTILITY FUNCTIONS
        // SEEING AS THERE IS NOT REALLY MUCH TO VALIDATE, LETS MOVE ALONG FOR NOW...
        
        return true
    }
    
    //MARK: - Helpers
    
    //MARK: Build url string
    
    /**
     Returns the full url string adding session token if specified
     */
    
    static func buildUrlString(withEndpoint endpoint: String, objectId: Int?, authenticationRequired: Bool) -> String {
        
        let baseUrl = APIController.versionedBaseUrlString
        
        // HERE I WOULD ALSO ATTACH A USERS SESSION TOKEN TO THE URL IF REQUIRED
        // AGAIN FOR NOW, LETS MOVE ALONG
        
        let urlString = baseUrl + endpoint
        return urlString
    }
    
    //MARK: Print message
    
    /**
     Style print messages to be more visible in the debug console
     */
    
    static public func printMessage(text: String) {
        print("\n** APIController ** - \(text)\n")
    }
}
