//
//  FlightTableViewCell.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit
import InfinityEngine

class FlightTableViewCell: UITableViewCell, InfinityCellViewAutoPlaceholdable {
    
    @IBOutlet weak private var placeView: UIView!
    @IBOutlet weak private var airlineLbl: UILabel!
    @IBOutlet weak private var departureAirportLbl: UILabel!
    @IBOutlet weak private var arrivalAirportLbl: UILabel!
    @IBOutlet weak private var depatureDateLbl: UILabel!
    @IBOutlet weak private var arrivalDateLbl: UILabel!
    @IBOutlet weak private var priceLbl: UILabel!

    var placeholderView: UIView {
        return self.placeView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func refresh(withFlight flight: Flight) {
        self.airlineLbl.text = flight.airline ?? "Airline Unknown"
        self.departureAirportLbl.text = flight.depatureAirport ?? "Departure Airport Unknown"
        self.arrivalAirportLbl.text = flight.arrivalAirport ?? "Arrival Airport Currently Unknown"
        self.depatureDateLbl.text = flight.depatureDateReadable ?? "No Depature Date Available"
        self.arrivalDateLbl.text = flight.arrivalDateReadable ?? "No Arrival Date Avaliable"
        self.priceLbl.text = flight.priceReadable ?? "No Price Currently, Check Back Later"
    }
}
