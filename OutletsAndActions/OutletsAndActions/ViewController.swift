//
//  ViewController.swift
//  OutletsAndActions
//
//  Created by Van Simmons on 3/22/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeText(_ sender: Any) {
        if myLabel.text == "Some Text" {
            myLabel.text = "Some other text"
        }
        else {
            myLabel.text = "Some Text"
        }
        myButton.titleLabel?.text = "Changed"
    }

}

