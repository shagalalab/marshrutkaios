//
//  RouteQuadCell.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/4/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteQuadCell: UITableViewCell {

    @IBOutlet weak var lblDisplayNo: UILabel!
    @IBOutlet weak var lblDestination1: UILabel!
    @IBOutlet weak var lblDestination2: UILabel!
    @IBOutlet weak var lblDestination3: UILabel!
    @IBOutlet weak var lblDestination4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
