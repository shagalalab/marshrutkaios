//
//  Routes.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/6/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import Foundation
import CoreData

class Route {

    var id: Int!
    var desc: String!
    var destinationsInDesc: [String]!
    var displayNumber: Int!
    var pathPointIds: [Destination]!
    var isBus: Bool!

    init(id: Int, isBus: Bool, displayNo: Int, description: String, pathPointIds: [Destination]) {
        self.id = id
        self.isBus = isBus
        self.displayNumber = displayNo
        self.desc = description
        self.pathPointIds = pathPointIds
        self.destinationsInDesc = description.componentsSeparatedByString(" - ")
    }
}
