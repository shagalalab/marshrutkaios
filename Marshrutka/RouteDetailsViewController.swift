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
    
    @IBOutlet weak var lblDestinations: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGlobalConstraints()
        
        if let selectedroute = route {
            lblTransportationType.text = (selectedroute.isBus! ? "Автобус" : "Маршрутка")
            lblDisplayNo.text = String(selectedroute.displayNumber)
            
            title = (selectedroute.isBus! ? "АВ-" : "") + String(selectedroute.displayNumber)
            
            var lastView: UIView?
            for destination in selectedroute.pathPointIds {
                var destLbl = generateUILabel(destination.name)
                containerView.addSubview(destLbl)
                if lastView == nil {
                    addConstraintsToSuper(destLbl, viewabove: lblDestinations, parentview: containerView, topmargin: 20)
                    
                } else {
                    addConstraintsToSuper(destLbl, viewabove: lastView!, parentview: containerView, topmargin: 8)
                }
                lastView = destLbl
            }
        }

        // Do any additional setup after loading the view.
    }
    
    func setGlobalConstraints() {
        var topConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        var bottomConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        var leftConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        var rightConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: scrollView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        scrollView.addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
        
        var widthConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        self.view.addConstraint(widthConstraint)
        
        /*var leftConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 0)
        var rightConstraint = NSLayoutConstraint(item: containerView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: super.view, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: 0)
        super.view.addConstraints([leftConstraint, rightConstraint])*/

    }
    
    func generateUILabel(text: String) -> UILabel {
        var lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 568, height: 22))
        lbl.setTranslatesAutoresizingMaskIntoConstraints(false)
        lbl.text = text
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: lbl.font.fontName, size: 17)
        lbl.textAlignment = NSTextAlignment.Center
        lbl.sizeToFit()
        return lbl
    }
    
    func addConstraintsToSuper(childview: UIView, viewabove: UIView, parentview: UIView, topmargin: Int) {
        var topConstraint = NSLayoutConstraint(item: childview, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: viewabove, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: CGFloat(topmargin))
        var leadingConstraint = NSLayoutConstraint(item: childview, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: parentview, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1, constant: 0)
        var trailingConstraint = NSLayoutConstraint(item: childview, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: parentview, attribute: NSLayoutAttribute.TrailingMargin, multiplier: 1, constant: 0)
        parentview.addConstraints([topConstraint, leadingConstraint, trailingConstraint])
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
