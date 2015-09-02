//
//  ViewController.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/1/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteListTableViewController: UITableViewController {
    
    var routes = [Route]()
    
    let cellIdentifierDouble = "routeDouble"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        routes.append(Route(ID: 1, isBus: true, displayNo: 4, description: "АЖМҚШ (Таслақ елаты) - Телеорай"))
        routes.append(Route(ID: 2, isBus: true, displayNo: 8, description: "Жийдели байсын елаты - Темир жол вокзалы"))
        routes.append(Route(ID: 3, isBus: false, displayNo: 21, description: "Орайлық базар - Қызкеткен елаты"))
        routes.append(Route(ID: 4, isBus: false, displayNo: 46, description: "Әскерий гарнизон - Саманбай елаты"))
        routes.append(Route(ID: 5, isBus: false, displayNo: 64, description: "Орайлық базар - Узынкөл бөлими (Намуналы жайлар)"))
        routes.append(Route(ID: 6, isBus: false, displayNo: 74, description: "Жуқпалы кеселликлер емлеўханасы - Маткаримов көшеси (1-автобаза)"))
        
        tableView.registerNib(UINib(nibName: "RouteDoubleCell", bundle: nil), forCellReuseIdentifier: cellIdentifierDouble)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierDouble) as! RouteDoubleCell
        
        var route = routes[indexPath.item]
        var destinationPoints = route.description.componentsSeparatedByString(" - ")
        cell.lblDisplayNo.text = getRouteDisplayNo(route)
        cell.lblDestination1.text = destinationPoints[0]
        cell.lblDestination2.text = destinationPoints[1]
        
        return cell
        
    }
    
    func getRouteDisplayNo(route: Route) -> String {
        var displayNo : String = String(route.displayNo)
        if route.isBus {
            displayNo = "АВ-" + displayNo
        }
        return displayNo
    }

}

