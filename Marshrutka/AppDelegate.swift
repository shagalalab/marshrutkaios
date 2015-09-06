//
//  AppDelegate.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/1/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        preloadData()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func preloadData() {
        preloadFromCSV("destinations", parsefunc: parseDestinations)
        preloadFromCSV("routes", parsefunc: parseRoutes)
        preloadFromCSV("reverseroutes", parsefunc: parseReverseRoutes)
        preloadFromCSV("reachabledestinations", parsefunc: parseReachableDestinations)
    }
    
    func parseDestinations(dataloader: DataLoader, values: [String]) {
        var id = values[0].toInt()!
        var name = values[1]
        var destination = Destination(id: id, name: name)
        dataloader.destinations.append(destination)
        dataloader.destinationMap[name] = id
        assert(id == dataloader.destinations.count-1, "ID does not match with array index in destinations")
    }
    
    func parseRoutes(dataloader: DataLoader, values: [String]) {
        var pathPointIds: [Destination] = []
        var id = values[0].toInt()!
        var isBus = (values[1] == "true")
        var displayNo = values[2].toInt()!
        var desc = values[3]
        var points: [String] = values[4].componentsSeparatedByString(",")
        for point in points {
            pathPointIds.append(dataloader.destinations[point.toInt()!])
        }
        var route = Route(id: id, isBus: isBus, displayNo: displayNo, description: desc, pathPointIds: pathPointIds)
        dataloader.routes.append(route)
        assert(id == dataloader.routes.count-1, "ID does not match with array index in routes")
    }
    
    func parseReverseRoutes(dataloader: DataLoader, values: [String]) {
        var routes = [Route]()
        var destId = values[0].toInt()!
        var routeIds = values[1].componentsSeparatedByString(",")
        for routeId in routeIds {
            routes.append(dataloader.routes[routeId.toInt()!])
        }
        var reverseRoute = ReverseRoutes(destinationId: destId, routeIds: routes)
        dataloader.reverseRoutes.append(reverseRoute)
        assert(destId == dataloader.reverseRoutes.count-1, "DestinationID does not match with array index in reverseRoutes")
    }
    
    func parseReachableDestinations(dataloader: DataLoader, values: [String]) {
        var destinations = [Destination]()
        var destId = values[0].toInt()!
        var reachabledestIdlist = values[1].componentsSeparatedByString(",")
        for reachabledestId in reachabledestIdlist {
            destinations.append(dataloader.destinations[reachabledestId.toInt()!])
        }
        var reachableDestination = ReachableDestinations(destinationId: destId, reachableDestinationIds: destinations)
        dataloader.reachableDestinations.append(reachableDestination)
    }
    
    func preloadFromCSV(csvfilename: String, parsefunc: (DataLoader, [String]) -> Void) {
        // Retrieve data from the source file
        if let contentsOfURL = NSBundle.mainBundle().URLForResource(csvfilename, withExtension: "csv") {
            
            var error: NSError?
            var dataloader = DataLoader.sharedInstance
            let delimiter = ", "
            if let content = String(contentsOfURL: contentsOfURL, encoding: NSUTF8StringEncoding, error: &error) {
                let lines: [String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
                
                for (index, line) in enumerate(lines) {
                    if line == "" || index == 0 {
                        continue
                    }
                    var values:[String] = line.componentsSeparatedByString(delimiter)
                    parsefunc(dataloader, values)
                }
            }
        }
    }
}

