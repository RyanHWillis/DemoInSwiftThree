//
//  JSONParseable.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import Foundation

public protocol JSONParseable {
    
    //MARK: - Parse json dictionary
    
    /**
     Parse a dictionary into a model objects
     
     params json: dictionary containing all model json data
     
     return model: model object converted from json data
     */
    static func createModel(withDictionary dict: Dictionary<String, AnyObject>) -> Any
    
    //MARK: - Parse json array
    
    /**
     Parse a array of dictionaries into a model objects
     
     params json: array containing all json dictionaries
     
     return model: array containing objects converted from json data
     */
    static func createModels(withArray array: [Dictionary<String, AnyObject>]) -> [Any]
    
    //MARK: - Parse json array & append to existing array
    
    /**
     Parse a array of dictionaries into a model objects & append to an existing array
     
     params array: array containing all json dictionaries
     params existingArray: existing array to which to append created objects
     
     return model: array containing existing array plus objects converted from json data
     */
    static func createModels(withArray array: [Dictionary<String, AnyObject>], andAppendToArray existingArray: [Any]?) -> [Any]
}

public extension JSONParseable {
    
    /**
     Default implementation of create models (array)
     */
    public static func createModels(withArray array: [Dictionary<String, AnyObject>]) -> [Any] {
        
        var models = [Any]()
        
        for dict in array {
            let model = self.createModel(withDictionary: dict)
            models.append(model)
        }
        return models
    }
    
    /**
     Default implementation of create models (array & append)
     */
    public static func createModels(withArray array: [Dictionary<String, AnyObject>], andAppendToArray existingArray: [Any]?) -> [Any] {
        
        if let existingModels = existingArray {
            let array = existingModels + self.createModels(withArray: array)
            return array
        }
        else {
            return self.createModels(withArray: array)
        }
    }
}
