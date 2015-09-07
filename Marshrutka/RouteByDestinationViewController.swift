//
//  RouteByDestinationViewController.swift
//  Marshrutka
//
//  Created by Aziz Murtazaev on 9/7/15.
//  Copyright (c) 2015 Shagala Lab. All rights reserved.
//

import UIKit

class RouteByDestinationViewController: UIViewController {

    @IBOutlet weak var txtStart: UITextField!
    @IBOutlet weak var txtEnd: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtEnd.text = "aaa"
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
