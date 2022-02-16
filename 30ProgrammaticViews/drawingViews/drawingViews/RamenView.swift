//
//  CustomView.swift
//  drawingViews
//
//  Created by Luat on 1/20/21.
//

import UIKit

class RamenView: UIView {

    var drawMore: Bool = false {
        didSet {
            // re-draw
            setNeedsDisplay()
        }
    }
    var widthOfLine: CGFloat = 1
    /**
        1. set color on UIColor
        2. Create Path
            - customize path
        3. path.stroke or path.fill
     */
    
    var clayColor: UIColor {
        UIColor(red: 1, green: 1, blue: change / 200, alpha: 1)
    }
    var change: CGFloat = 0
    
    override func draw(_ rect: CGRect) {
        UIColor(red: 1, green: 0.5, blue: 0.1, alpha: 1).set()
        makeCurve().fill()
        if drawMore {
            for num in 0...20 {
                clayColor.set()
                change = CGFloat(num * 10)
                makeSwiggly(change: change).stroke()
            }
            change = 0
        }
        UIColor.red.set()
        makeLine().stroke() // or path.fill()
        makeLineTwo().stroke()
    }
    
    func makeLine() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 125, y: 125))
        path.lineWidth = widthOfLine
        return path
    }
    
    func makeLineTwo() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -10, y: 10))
        path.addLine(to: CGPoint(x: 135, y: 115))
        path.lineWidth = widthOfLine
        return path
    }
    
    func makeCurve() -> UIBezierPath {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        let radius = CGFloat(90)
        
        let path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: PieConstants.halfCircle, clockwise: true)
        return path
        
    }
    
    func makeSwiggly(change: CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0 + change, y: 0))
        let endPoint = CGPoint(x: bounds.size.width - change, y: bounds.size.height)
        let gravityPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
        let gravityPointEnd = CGPoint(x: 0, y: 200)
        path.addCurve(to: endPoint, controlPoint1: gravityPoint, controlPoint2: gravityPointEnd)
        return path
    }
}

struct PieConstants {
    static let fullCircle = 2 * CGFloat.pi
    static let halfCircle = fullCircle / 2
    static let quarterCircle = fullCircle / 4
}
