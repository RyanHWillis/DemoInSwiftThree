//
//  FlightTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func refresh(withFlight flight: Flight) {
        
    }
}
