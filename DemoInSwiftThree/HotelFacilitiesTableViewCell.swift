//
//  HotelFacilitiesTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelFacilitiesTableViewCell: HotelTableViewCell {
    
    @IBOutlet weak internal var facilitiesLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func refresh(withHotel hotel: Hotel) {
        
        guard let facilities = hotel.facilities else {
            self.facilitiesLbl.text = "N/A"
            return
        }
        
        var facilityAppendString = ""
        for (index, facility) in facilities.enumerated() {
            if index == facilities.count - 1 {
                facilityAppendString = facilityAppendString + facility
            } else {
                facilityAppendString = facilityAppendString + facility + ", "
            }
        }
        
        self.facilitiesLbl.text = facilityAppendString
    }
}
