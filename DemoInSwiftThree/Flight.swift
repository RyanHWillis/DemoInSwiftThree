//
//  Flight.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

struct Flight: JSONParseable {
    
    public var airline: String?
    public var depatureDateRaw: String?
    public var arrivalDateRaw: String?
    public var depatureDate: Date?
    public var arrivalDate: Date?
    public var depatureDateReadable: String?
    public var arrivalDateReadable: String?
    public var price: NSNumber?
    public var priceReadable: String?
    public var depatureAirport: String?
    public var arrivalAirport: String?
    
    // MARK: - Helpers
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static var localCurrencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale.current
        return formatter
    }()
    
    static func createModel(withDictionary dict: Dictionary<String, AnyObject>) -> Any {
        var model = Flight()
        
        model.airline = dict["airline"] as? String
        model.depatureAirport = dict["departure_airport"] as? String
        model.arrivalAirport = dict["arrival_airport"] as? String
        
        if let depatureDateRaw = dict["departure_date"] as? String {
            model.depatureDateRaw = depatureDateRaw

            if let dateFromString = depatureDateRaw.dateFromISO8601 {
                model.depatureDate = dateFromString
                model.depatureDateReadable = self.dateFormatter.string(from: dateFromString)
            }
        }
        
        if let arrivalDateRaw = dict["arrival_date"] as? String {
            model.arrivalDateRaw = arrivalDateRaw
            
            if let dateFromString = arrivalDateRaw.dateFromISO8601 {
                model.arrivalDate = dateFromString
                model.arrivalDateReadable = self.dateFormatter.string(from: dateFromString)
            }
        }
        
        if let price = dict["price"] as? NSNumber {
            model.price = price
            model.priceReadable = self.localCurrencyFormatter.string(from: price)
        }
        
        return model
    }

}
