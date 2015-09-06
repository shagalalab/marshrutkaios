//
//  ReverseRoutes.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/6/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import Foundation

class ReverseRoutes {
    var destinationId: Int!
    var routeIds: [Route]!
    
    init(destinationId: Int, routeIds: [Route]) {
        self.destinationId = destinationId
        self.routeIds = routeIds
    }
}
