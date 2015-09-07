//
//  RouteDetailsViewController.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/7/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteDetailsViewController: UIViewController {

    var route: Route?

    @IBOutlet weak var lblTransportationType: UILabel!
    @IBOutlet weak var lblDisplayNo: UILabel!
    
    @IBOutlet weak var lblDestination1: UILabel!
    @IBOutlet weak var lblDestination2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedroute = route {
            lblTransportationType.text = (selectedroute.isBus! ? "Автобус" : "Маршрутка")
            lblDisplayNo.text = String(selectedroute.displayNumber)
            lblDestination1.text = selectedroute.pathPointIds[0].name
            lblDestination2.text = selectedroute.pathPointIds[1].name
            
            title = (selectedroute.isBus! ? "АВ-" : "") + String(selectedroute.displayNumber)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
