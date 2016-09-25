//
//  HotelLocationTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelLocationTableViewCell: HotelTableViewCell {
    
    @IBOutlet weak internal var locationLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func refresh(withHotel hotel: Hotel) {
        self.locationLbl.text = hotel.location ?? "N/A"
    }
}
