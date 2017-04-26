//
//  GridEditorViewController.swift
//  Lecture11
//
//  Created by Van Simmons on 4/17/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class GridEditorViewController: UIViewController {
    
    var fruitValue: String?
    var saveClosure: ((String) -> Void)?
    
    @IBOutlet weak var fruitValueTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        if let fruitValue = fruitValue {
            fruitValueTextField.text = fruitValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: UIButton) {
        if let newValue = fruitValueTextField.text,
           let saveClosure = saveClosure {
            saveClosure(newValue)
            self.navigationController?.popViewController(animated: true)
        }
    }


}
