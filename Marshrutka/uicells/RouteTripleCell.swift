//
//  RouteTripleCell.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/2/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteTripleCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var lblDisplayNo: UILabel!
    @IBOutlet weak var lblDestination1: UILabel!
    @IBOutlet weak var lblDestination2: UILabel!
    @IBOutlet weak var lblDestination3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
