//
//  Hotel.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

struct Hotel: JSONParseable {
    
    public var name: String?
    public var location: String?
    public var description: String?
    public var images: [URL]?
    public var rating: Int?
    public var facilities: [String]?
    
    static func createModel(withDictionary dict: Dictionary<String, AnyObject>) -> Any {
        var model = Hotel()
        
        model.name = dict["name"] as? String
        model.location = dict["hotel_location"] as? String
        model.description = dict["description"] as? String
        
        if let images = dict["images"] as? [String] {
            model.images = [URL]()
            for image in images {
                guard let url = URL(string: image) else { break }
                model.images?.append(url)
            }
        }
        
        model.rating = dict["rating"] as? Int
        model.facilities = dict["facilities"] as? [String]
        
        return model
    }

}
