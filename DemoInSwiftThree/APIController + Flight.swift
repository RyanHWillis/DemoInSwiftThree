//
//  APIController + Flight.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

extension APIController {
    
    //MARK: - Hotel
    /**
     Attempt to fetch all Hotels
     */
    
    static func fetchFlights(completion: @escaping (_ flights: [Flight]?) -> ()) {
        
        let request = BasicRequest(endpoint: APIEndpoints.Flights, objectId: nil, method: .get, authenticationRequired: false, parameters: nil)
        
        APIController.execute(request: request, success: { (responseSuccess) in
            
            
            guard let payload = responseSuccess.result.value as? Dictionary<String, AnyObject>,
                let data = payload["flights"] as? [Dictionary<String, AnyObject>] else {
                completion(nil)
                return
            }
            
            guard let flights = Flight.createModels(withArray: data) as? [Flight] else {
                completion(nil)
                return
            }
            
            completion(flights)
            
            
        }) { (responseFailure) in
            completion(nil)
        }
    }
}
