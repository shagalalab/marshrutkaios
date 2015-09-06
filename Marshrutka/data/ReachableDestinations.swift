//
//  ReachableDestinations.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/6/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import Foundation

class ReachableDestinations {

    var destinationId: Int!
    var reachableDestinationIds: [Destination]!
    
    init(destinationId: Int, reachableDestinationIds: [Destination]) {
        self.destinationId = destinationId
        self.reachableDestinationIds = reachableDestinationIds
    }
}
