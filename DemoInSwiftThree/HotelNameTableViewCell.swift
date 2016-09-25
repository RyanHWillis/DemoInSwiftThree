//
//  HotelNameTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelNameTableViewCell: HotelTableViewCell {
    
    @IBOutlet weak internal var  nameLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func refresh(withHotel hotel: Hotel) {
        self.nameLbl.text = hotel.name ?? "N/A"
    }
}
