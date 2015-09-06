//
//  DataLoader.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/6/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import Foundation

class DataLoader {
    var destinations: [Destination] = []
    var routes: [Route] = []
    var reverseRoutes: [ReverseRoutes] = []
    var reachableDestinations: [ReachableDestinations] = []
    
    var destinationMap = [String: Int]()
    
    static let sharedInstance = DataLoader()
    private init() {}
    
}