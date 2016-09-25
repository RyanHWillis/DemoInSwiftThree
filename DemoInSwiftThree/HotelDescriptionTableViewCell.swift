//
//  HotelDescriptionTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelDescriptionTableViewCell: HotelTableViewCell {
    
    @IBOutlet weak internal var descriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func refresh(withHotel hotel: Hotel) {
        self.descriptionLbl.text = hotel.description ?? "N/A"
    }
    
}
