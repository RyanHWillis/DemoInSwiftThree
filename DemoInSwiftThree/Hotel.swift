//
//  Hotel.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class Hotel: JSONParseable {
    
    public var name: String?
    public var location: String?
    public var description: String?
    public var images: [URL]?
    public var rating: Int?
    public var facilties: [String]?
    
    static func createModel(withDictionary dict: Dictionary<String, AnyObject>) -> Any {
        let model = Hotel()
        
        model.name = dict["name"] as? String
        model.location = dict["hotel_location"] as? String
        model.description = dict["description"] as? String
        
        if let images = dict["images"] as? NSArray {
            for image in images {
                guard let imgString = image as? String, let url = URL(string: imgString) else { break }
                model.images?.append(url)
            }
        }
        
        model.rating = dict["rating"] as? Int
        
        if let facilities = dict["facilities"] as? NSArray {
            for facility in facilities {
                guard let fac = facility as? String else { break }
                model.facilties?.append(fac)
            }
        }
        
        return model
    }

}
