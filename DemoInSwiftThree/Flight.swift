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
    public var price: Double?
    public var depatureAirport: String?
    public var arrivalAirport: String?
    
    // MARK: - Helpers
    
    private static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static func createModel(withDictionary dict: Dictionary<String, AnyObject>) -> Any {
        var model = Flight()
        
        model.airline = dict["airline"] as? String
        model.price = dict["price"] as? Double
        model.depatureAirport = dict["departure_airport"] as? String
        model.arrivalAirport = dict["arrival_airport"] as? String
        
        if let depatureDateRaw = dict["departure_date"] as? String {
            model.depatureDateRaw = depatureDateRaw
            if let depatureDateFormatted = Flight.dateFormatter.date(from: depatureDateRaw) {
                model.depatureDate = depatureDateFormatted
            }
        }
        
        if let arrivalDateRaw = dict["arrival_date"] as? String {
            model.arrivalDateRaw = arrivalDateRaw
            if let arrivalDateFormatted = Flight.dateFormatter.date(from: arrivalDateRaw) {
                model.arrivalDate = arrivalDateFormatted
            }
        }
        
        return model
    }

}
