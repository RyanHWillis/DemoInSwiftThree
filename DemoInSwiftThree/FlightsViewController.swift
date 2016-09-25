//
//  FlightsViewController.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit
import InfinityEngine

internal enum FlightTableCell {
    
    case detail
    case loader
    
    var identifer: String {
        switch self {
        case .detail:
            return "FlightTableViewCell"
        case .loader:
            return "LoadingTableViewCell"
        }
    }
    
    static let identifers = [FlightTableCell.detail.identifer, FlightTableCell.loader.identifer]
}

class FlightsViewController: UIViewController {
    
    @IBOutlet weak fileprivate var tableView: UITableView!
    
    fileprivate var flights: [Flight]?
    
    init() {
        super.init(nibName: "FlightsViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cells = InfinityCells(cellNames: [FlightTableCell.detail.identifer], loadingCellName: FlightTableCell.loader.identifer, bundle: nil)
        let tableView = InfinityTableView(withTableView: self.tableView, withCells: cells, withDataSource: self)
        self.startInfinityTableView(infinityTableView: tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

/**
 I'm not cheating by using cocoapod InfinityEngine, I wrote this cocoapod. in-fact I just updated it to Swift 3 ;)
 Normally used for paged endpoints, but i'll set lastPage to true for now.
 */

extension FlightsViewController: InfinityTableProtocol {
    
    func tableView(_ tableView: UITableView, withDataForPage page: Int, forSession session: String, completion: @escaping (ResponsePayload) -> ()) {
        APIController.fetchFlights { (flights) in
            guard let flights = flights else { return }
            self.flights = flights
            completion(ResponsePayload(count: [flights.count], lastPage: true, session: session))
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: FlightTableCell.detail.identifer, for: indexPath) as! FlightTableViewCell
        if let flight = self.flights?[indexPath.row] {
            cell.refresh(withFlight: flight)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, withLoadingCellItemForIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: FlightTableCell.loader.identifer, for: indexPath) as! LoadingTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath, forLoadingCell loadingCell: Bool) -> CGFloat {
        if loadingCell {
            return 30.0
        }
        return 180.0
    }
}
