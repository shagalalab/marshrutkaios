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
    let cellIdentifierTriple = "routeTriple"
    let cellIdentifierQuad = "routeQuad"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        routes.append(Route(ID: 11, isBus: true, displayNo: 1, description: "Темир жол вокзалы - Орайлық базар - Таслақ елаты - Темир жол вокзалы"))
        routes.append(Route(ID: 1, isBus: true, displayNo: 4, description: "АЖМҚШ (Таслақ елаты) - Телеорай"))
        routes.append(Route(ID: 2, isBus: true, displayNo: 8, description: "Жийдели байсын елаты - Темир жол вокзалы"))
        routes.append(Route(ID: 12, isBus: true, displayNo: 5, description: "Шадлы аўыл - Темир жол вокзалы - Таслақ елаты - Шадлы аўыл"))
        routes.append(Route(ID: 3, isBus: false, displayNo: 21, description: "Орайлық базар - Қызкеткен елаты"))
        routes.append(Route(ID: 13, isBus: false, displayNo: 43, description: "Таслақ елаты - Түйемойын - Орайлық базар - Темир жол вокзалы"))
        routes.append(Route(ID: 4, isBus: false, displayNo: 46, description: "Әскерий гарнизон - Саманбай елаты"))
        routes.append(Route(ID: 5, isBus: false, displayNo: 64, description: "Орайлық базар - Узынкөл бөлими (Намуналы жайлар)"))
        routes.append(Route(ID: 6, isBus: false, displayNo: 74, description: "Жуқпалы кеселликлер емлеўханасы - Маткаримов көшеси (1-автобаза)"))
        routes.append(Route(ID: 7, isBus: true, displayNo: 3, description: "Темир жол вокзалы - Орайлық базар - Жийдели байсын елаты"))
        routes.append(Route(ID: 8, isBus: true, displayNo: 11, description: "Гөне қала - Орайлық базар - Қызкеткен елаты"))
        routes.append(Route(ID: 9, isBus: false, displayNo: 8, description: "Алланияз қаҳарман (А. Арзымов көшеси) - Арқа автовокзал - Орайлық туўыў үйи"))
        routes.append(Route(ID: 10, isBus: false, displayNo: 34, description: "Орайлық базар - Орайлық автовокзал - Нөкис саўда комплекс"))
        
        tableView.registerNib(UINib(nibName: "RouteDoubleCell", bundle: nil), forCellReuseIdentifier: cellIdentifierDouble)
        tableView.registerNib(UINib(nibName: "RouteTripleCell", bundle: nil), forCellReuseIdentifier: cellIdentifierTriple)
        tableView.registerNib(UINib(nibName: "RouteQuadCell", bundle: nil), forCellReuseIdentifier: cellIdentifierQuad)
        
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
        
        var route = routes[indexPath.item]
        
        if route.destinations.count == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierDouble) as! RouteDoubleCell
            
            cell.lblDisplayNo.text = getRouteDisplayNo(route)
            cell.lblDestination1.text = route.destinations[0]
            cell.lblDestination2.text = route.destinations[1]
            
            return cell
        } else if route.destinations.count == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierTriple) as! RouteTripleCell
            
            cell.lblDisplayNo.text = getRouteDisplayNo(route)
            cell.lblDestination1.text = route.destinations[0]
            cell.lblDestination2.text = route.destinations[1]
            cell.lblDestination3.text = route.destinations[2]
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierQuad) as! RouteQuadCell
            
            cell.lblDisplayNo.text = getRouteDisplayNo(route)
            cell.lblDestination1.text = route.destinations[0]
            cell.lblDestination2.text = route.destinations[1]
            cell.lblDestination3.text = route.destinations[2]
            cell.lblDestination4.text = route.destinations[3]
            return cell
        }
    }
    
    func getRouteDisplayNo(route: Route) -> String {
        var displayNo : String = String(route.displayNo)
        if route.isBus {
            displayNo = "АВ-" + displayNo
        }
        return displayNo
    }

}

