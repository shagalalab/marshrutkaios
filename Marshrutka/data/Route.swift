//
//  Route.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/2/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

class Route  {
    var ID: Int
    var isBus: Bool
    var displayNo: Int
    var description: String
    
    init(ID: Int, isBus: Bool, displayNo: Int, description: String) {
        self.ID = ID
        self.isBus = isBus
        self.displayNo = displayNo
        self.description = description
    }
    
}
