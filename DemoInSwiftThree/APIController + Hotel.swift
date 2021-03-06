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
    
    static func fetchHotel(completion: @escaping (_ hotels: Hotel?) -> ()) {
        
        let request = BasicRequest(endpoint: APIEndpoints.Hotels, objectId: nil, method: .get, authenticationRequired: false, parameters: nil)
        
        APIController.execute(request: request, success: { (responseSuccess) in
        
            guard let data = responseSuccess.result.value as? Dictionary<String, AnyObject> else {
                completion(nil)
                return
            }
            
            guard let hotel = Hotel.createModel(withDictionary: data) as? Hotel else {
                completion(nil)
                return
            }
            
            completion(hotel)
            
            
        }) { (responseFailure) in
            completion(nil)
        }
    }
}
