//
//  ViewController.swift
//  Lecture14a
//
//  Created by Van Simmons on 5/8/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class A {
    var b: B?
}

class B {
    var a: A?
}

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        (0 ... 100000).forEach { _ in
            var a = A()
            var b = B()
            a.b = b
            b.a = a
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

