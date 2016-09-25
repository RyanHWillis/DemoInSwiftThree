//
//  FlightTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class FlightTableViewCell: UITableViewCell {
    
    @IBOutlet weak internal var airlineLbl: UILabel!
    @IBOutlet weak internal var departureAirportLbl: UILabel!
    @IBOutlet weak internal var arrivalAirportLbl: UILabel!
    @IBOutlet weak internal var depatureDateLbl: UILabel!
    @IBOutlet weak internal var arrivalDateLbl: UILabel!
    @IBOutlet weak internal var priceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func refresh(withFlight flight: Flight) {
        self.airlineLbl.text = flight.airline
        self.departureAirportLbl.text = flight.depatureAirport
        self.arrivalAirportLbl.text = flight.arrivalAirport
        self.depatureDateLbl.text = String(describing: flight.depatureDate)
        self.arrivalDateLbl.text = String(describing: flight.arrivalDate)
        self.priceLbl.text = String(describing: flight.price)
    }
}
