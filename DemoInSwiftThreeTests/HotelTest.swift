//
//  HotelTest.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 26/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import XCTest
@testable import DemoInSwiftThree

class HotelTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit_ShouldInitHotel() {
        
        let hotel = Hotel(name: "Hotel Resort", location: "Spain", description: "Beautiful, and close",
                          images: [URL(string: "www.google.com")!], rating: 5, facilities: ["Pool", "Spa"])
        
        XCTAssertEqual(hotel.name, "Hotel Resort")
        XCTAssertEqual(hotel.location, "Spain")
        XCTAssertEqual(hotel.description, "Beautiful, and close")
        XCTAssertEqual(hotel.rating, 5)

        
    }
    
}
