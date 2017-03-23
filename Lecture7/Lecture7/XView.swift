//
//  XView.swift
//  Lecture6
//
//  Created by Van Simmons on 3/6/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

@IBDesignable class XView: UIView {

    @IBInspectable var fillColor = UIColor.darkGray
    var xColor = UIColor.black
    var xProportion = CGFloat(1.0)
    var widthProportion = CGFloat(0.05)
    
    // Updated since class
    var grid = [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3)
    
    override func draw(_ rect: CGRect) {
        let size = CGSize(
            width: rect.size.width / 3.0,
            height: rect.size.height / 3.0
        )
        let base = rect.origin
        (0 ..< 3).forEach { i in
            (0 ..< 3).forEach { j in
                let origin = CGPoint(
                    x: base.x + (CGFloat(j) * size.width),
                    y: base.y + (CGFloat(i) * size.height)
                )
                let subRect = CGRect(
                    origin: origin,
                    size: size
                )
                if grid[i][j] {
                    let path = UIBezierPath(ovalIn: subRect)
                    fillColor.setFill()
                    path.fill()
                }
            }
        }

        //create the path
        (0 ..< 4).forEach {
            drawLine(
                start: CGPoint(x: CGFloat($0)/3.0 * rect.size.width, y: 0.0),
                end:   CGPoint(x: CGFloat($0)/3.0 * rect.size.width, y: rect.size.height)
            )
            
            drawLine(
                start: CGPoint(x: 0.0, y: CGFloat($0)/3.0 * rect.size.height ),
                end: CGPoint(x: rect.size.width, y: CGFloat($0)/3.0 * rect.size.height)
            )
        }
    }
    func drawLine(start:CGPoint, end: CGPoint) {
        let path = UIBezierPath()
        
        //set the path's line width to the height of the stroke
        path.lineWidth = 2.0
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        path.move(to: start)
        
        //add a point to the path at the end of the stroke
        path.addLine(to: end)
        
        //draw the stroke
        UIColor.cyan.setStroke()
        path.stroke()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchedPosition = process(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchedPosition = process(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchedPosition = nil
    }
    
    // Updated since class
    typealias Position = (row: Int, col: Int)
    var lastTouchedPosition: Position?

    func process(touches: Set<UITouch>) -> Position? {
        guard touches.count == 1 else { return nil }
        let pos = convert(touch: touches.first!)
        guard lastTouchedPosition?.row != pos.row
            || lastTouchedPosition?.col != pos.col
            else { return pos }
        
        grid[pos.row][pos.col] = grid[pos.row][pos.col] ? false : true
        setNeedsDisplay()
        return pos
    }
    
    func convert(touch: UITouch) -> Position {
        let touchY = touch.location(in: self).y
        let gridHeight = frame.size.height
        let row = touchY / gridHeight * CGFloat(3)
        let touchX = touch.location(in: self).x
        let gridWidth = frame.size.width
        let col = touchX / gridWidth * CGFloat(3)
        let position = (row: Int(row), col: Int(col))
        return position
    }
}

