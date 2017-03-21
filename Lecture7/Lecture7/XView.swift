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

    override func draw(_ rect: CGRect) {
        let size = CGSize(
            width: rect.size.width / 3.0,
            height: rect.size.height / 3.0
        )
        let base = rect.origin
        (0 ..< 3).forEach { i in
            (0 ..< 3).forEach { j in
                let origin = CGPoint(
                    x: base.x + (CGFloat(i) * size.width),
                    y: base.y + (CGFloat(j) * size.height)
                )
                let subRect = CGRect(
                    origin: origin,
                    size: size
                )
                if arc4random_uniform(2) == 1 {
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
        //lastTouchedPosition = process(touches: touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //lastTouchedPosition = process(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //lastTouchedPosition = nil
    }
}

