//
//  HotelDetailTableView.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

internal protocol HotelDetailTableViewDelegate: class {
    func hotelDetailTableViewDidUpdate()
}

internal enum HotelTableCell {
    
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
    
    static let identifers = [HotelTableCell.name.identifer, HotelTableCell.location.identifer,
                HotelTableCell.description.identifer, HotelTableCell.facilties.identifer]
}

internal class HotelDetailTableView: UITableView {
    
    fileprivate var hotel: Hotel!
    fileprivate var detailDelegate: HotelDetailTableViewDelegate?
    
    init(withHotel hotel: Hotel, delegate: HotelDetailTableViewDelegate?) {
        super.init(frame: UIScreen.main.bounds, style: .plain)
        self.hotel = hotel
        self.detailDelegate = delegate
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setup() {
        self.separatorStyle = .none
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
        
        for identifer in HotelTableCell.identifers {
            self.register(UINib(nibName: identifer, bundle: Bundle.main), forCellReuseIdentifier: identifer)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.detailDelegate?.hotelDetailTableViewDidUpdate()
    }
}

extension HotelDetailTableView: UITableViewDelegate, UITableViewDataSource {
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HotelTableCell.identifers.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: - Cells
    
    fileprivate func addHotelNameTableViewCell() -> HotelNameTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: HotelTableCell.name.identifer) as! HotelNameTableViewCell
        cell.refresh(withHotel: self.hotel)
        return cell
    }
    
    fileprivate func addHotelLocationTableViewCell() -> HotelLocationTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: HotelTableCell.location.identifer) as! HotelLocationTableViewCell
        cell.refresh(withHotel: self.hotel)
        return cell
    }
    
    fileprivate func addHotelDescriptionTableViewCell() -> HotelDescriptionTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: HotelTableCell.description.identifer) as! HotelDescriptionTableViewCell
        cell.refresh(withHotel: self.hotel)
        return cell
    }
    
    fileprivate func addHotelFacilitiesTableViewCell() -> HotelFacilitiesTableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: HotelTableCell.facilties.identifer) as! HotelFacilitiesTableViewCell
        cell.refresh(withHotel: self.hotel)
        return cell
    }
}


