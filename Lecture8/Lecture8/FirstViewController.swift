//
//  FirstViewController.swift
//  Lecture8
//
//  Created by Van Simmons on 3/27/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var gridView: XView!
    var grid: Grid = Grid(GridSize(rows: 3,cols: 3))
    var timer: Timer? {
        didSet {
            print ("changing timer")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = gridView.gridSize
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.grid = grid
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func next(_ sender: Any) {
        grid = gridView.grid as! Grid
        grid = grid.next()
        gridView.grid = grid
        gridView.setNeedsDisplay()
    }
    
    @IBAction func stop(_ sender: Any) {
        if let timer = timer {
            timer.invalidate()
        }
        timer = nil
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true
        ) { (t: Timer) in
            self.grid = self.gridView.grid as! Grid
            self.grid = self.grid.next()
            self.gridView.grid = self.grid
            self.gridView.setNeedsDisplay()
        }
    }
    
    
    @IBAction func increaseGridSize(_ sender: Any) {
        let size = gridView.gridSize + 1
        gridView.gridSize = size
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.setNeedsDisplay()
    }
    
    @IBAction func decreaseGridSize(_ sender: Any) {
        let size = gridView.gridSize - 1
        gridView.gridSize = size
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.setNeedsDisplay()
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(textField.text)
//    }

}

