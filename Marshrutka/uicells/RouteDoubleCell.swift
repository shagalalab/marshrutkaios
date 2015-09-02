//
//  RouteDoubleCell.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/2/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteDoubleCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var lblDisplayNo: UILabel!
    @IBOutlet weak var lblDestination1: UITextField!
    @IBOutlet weak var lblDestination2: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblDisplayNo.textAlignment = NSTextAlignment.Center
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
