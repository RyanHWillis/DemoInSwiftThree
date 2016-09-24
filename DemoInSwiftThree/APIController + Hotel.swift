//
//  APIController + Hotel.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

extension APIController {
    
    //MARK: - Hotel
    /**
     Attempt to fetch all Hotels
     */
    
    static func fetchHotels(completion: @escaping (_ hotels: [Any]?) -> ()) {
        
        let request = BasicRequest(endpoint: APIEndpoints.Hotels, objectId: nil, method: .get, authenticationRequired: true, parameters: nil)
        
        APIController.execute(request: request, success: { (responseSuccess) in
            
            
            
        }) { (responseFailure) in
            completion(nil)
        }
        
        
        
        
        /*
        APIController.execute(request, success: { (response) in
            guard let payload = response.responsePayload(), let data = payload["data"] as? [Dictionary<String, AnyObject>] else {
                completion(treatments: nil, lastPage: nil)
                return
            }
            completion(treatments: Treatment.createModels(withArray: data), lastPage: false)
            return
        }) { (response) in
            completion(treatments: nil, lastPage: nil)
            return
        }
 
        */
    }
}
