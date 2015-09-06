//
//  Destinations.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/6/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import Foundation
import CoreData

class Destination {
    var id: Int!
    var name: String!
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
