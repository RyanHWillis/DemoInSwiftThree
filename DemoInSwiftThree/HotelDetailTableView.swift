//
//  HotelDetailTableView.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

public enum HotelTableCell {
    
    case name
    case location
    case description
    case facilties
    
    var identifer: String {
        switch self {
        case .name:
            return "HotelNameTableViewCell"
        case .location:
            return "HotelLocationTableViewCell"
        case .description:
            return "HotelDescriptionTableViewCell"
        case .facilties:
            return "HotelFacilitiesTableViewCell"
        }
    }
    
    func identifers() -> [String] {
        return [HotelTableCell.name.identifer, HotelTableCell.location.identifer,
                HotelTableCell.description.identifer, HotelTableCell.facilties.identifer]
    }
}

private class HotelDetailTableView: UITableView {
    
    private var hotel: Hotel!
    
    init(withHotel hotel: Hotel) {
        super.init(frame: UIScreen.main.bounds, style: .plain)
        self.hotel = hotel
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setup() {
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension HotelDetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    fileprivate func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    fileprivate func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    fileprivate func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.addHotelNameTableViewCell()
        case 1:
            return self.addHotelLocationTableViewCell()
        case 2:
            return self.addHotelDescriptionTableViewCell()
        case 3:
            return self.addHotelFacilitiesTableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    fileprivate func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(indexPath.row)
        //self.paneDelegate?.detailPaneDidUpdate()
        
        return UITableViewAutomaticDimension
    }
    
    fileprivate func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Cells
    
    private func addHotelNameTableViewCell() -> HotelNameTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "HotelNameTableViewCell") as! HotelNameTableViewCell
        return cell
    }
    
    private func addHotelLocationTableViewCell() -> HotelLocationTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "HotelLocationTableViewCell") as! HotelLocationTableViewCell
        return cell
    }
    
    private func addHotelDescriptionTableViewCell() -> HotelDescriptionTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "HotelDescriptionTableViewCell") as! HotelDescriptionTableViewCell
        return cell
    }
    
    private func addHotelFacilitiesTableViewCell() -> HotelFacilitiesTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "HotelFacilitiesTableViewCell") as! HotelFacilitiesTableViewCell
        return cell
    }
}


