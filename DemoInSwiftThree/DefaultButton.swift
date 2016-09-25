//
//  HotelLocationTableViewCell.swift
//  DefaultButton
//
//  Created by Ryan Willis on 25/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {
    
    //MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: Common
    func commonInit() {
        self.setAppearance()
    }
    
    //MARK: - Appearance
    
    func setAppearance() {
        self.backgroundColor = UIColor.yellow
        self.tintColor = UIColor.black
    }
}
