//
//  FrameAndBoundsViewController.swift
//  Lecture10
//
//  Created by Van Simmons on 4/10/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FrameAndBoundsViewController: UIViewController {

    @IBOutlet var boundsView: UIView!
    var boundsFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boundsFrame = boundsView.frame
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func step(_ sender: UIStepper) {
        var bounds = boundsView.bounds
        bounds.origin.y = CGFloat(sender.value) * 10.0
        boundsView.bounds = bounds
    }

 
}
