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
        let lineWidth: CGFloat = 8.0
        
        //create the path
        let verticalPath = UIBezierPath()
        var start = CGPoint(
            x: rect.origin.x + rect.size.width / 2.0,
            y: rect.origin.y
        )
        var end = CGPoint(
            x: rect.origin.x + rect.size.width / 2.0,
            y: rect.origin.y + rect.size.height
        )
        
        //set the path's line width to the height of the stroke
        verticalPath.lineWidth = lineWidth
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        verticalPath.move(to: start)
        
        //add a point to the path at the end of the stroke
        verticalPath.addLine(to: end)
        
        //draw the stroke
        UIColor.cyan.setStroke()
        verticalPath.stroke()
        
        let horizontalPath = UIBezierPath()
        start = CGPoint(
            x: rect.origin.x,
            y: rect.origin.y + rect.size.height / 2.0
        )
        end = CGPoint(
            x: rect.origin.x + rect.size.width,
            y: rect.origin.y + rect.size.height / 2.0
        )
        //move the initial point of the path
        //to the start of the horizontal stroke
        horizontalPath.move(to: start)
        
        //add a point to the path at the end of the stroke
        horizontalPath.addLine(to: end)
        horizontalPath.lineWidth = lineWidth
        UIColor.green.setStroke()
        horizontalPath.stroke()
    }
}
