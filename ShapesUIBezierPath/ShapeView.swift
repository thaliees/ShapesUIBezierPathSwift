//
//  ShapeView.swift
//  ShapesUIBezierPath
//
//  Created by Thaliees on 1/15/20.
//  Copyright © 2020 Thaliees. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    var name: String = ""
    var colorShape: UIColor = UIColor.clear
    var points:[CGPoint] = []
    var controlPoints:[[CGPoint]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        if name == "Ticket" { shapeTicket() }
        else if name == "Mark" { shapeMark() }
        else if name == "Rosette" { shapeRosette() }
        else if name == "PieChart" { shapePieChart() }
        else if name == "Beizer" { shapeBeizer() }
    }
    
    func shapeTicket() {
        layer.sublayers?.removeAll()
        let size = self.bounds.size

        // Calculate the points of the figure
        let p0 = self.bounds.origin
        let p1 = CGPoint(x: p0.x, y: p0.y + 100)
        let p2 = CGPoint(x: p1.x, y: p1.y + 20)
        let p3 = CGPoint(x: p2.x, y: size.height)
        let p4 = CGPoint(x: size.width, y: size.height)
        let p5 = CGPoint(x: p4.x, y: p2.y)
        let p6 = CGPoint(x: p5.x, y: p1.y)
        let p7 = CGPoint(x: p6.x, y: p0.y)
        
        // Calculate the control points of the curves
        let pc1 = CGPoint(x: p1.x + 10, y: p1.y + 10)
        let pc2 = CGPoint(x: p6.x - 10, y: p6.y + 10)
        
        // Create the path
        let path = UIBezierPath()
        path.move(to: p0)
        path.addLine(to: p1)
        path.addQuadCurve(to: p2, controlPoint: pc1)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.addLine(to: p5)
        path.addQuadCurve(to: p6, controlPoint: pc2)
        path.addLine(to: p7)
        path.close()
        
        colorShape.setFill()
        path.fill()
    }
    
    func shapeMark() {
        layer.sublayers?.removeAll()
        let size = self.bounds.size
        let percent = size.height * 0.85

        // Calculate the points of the figure
        let p0 = self.bounds.origin
        let p1 = CGPoint(x: p0.x, y: percent)
        let p2 = CGPoint(x: size.width / 2, y: size.height)
        let p3 = CGPoint(x: size.width, y: p1.y)
        let p4 = CGPoint(x: p3.x, y: p0.y)
        
        // Create the path
        let path = UIBezierPath()
        path.move(to: p0)
        path.addLine(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.close()
        
        colorShape.setFill()
        path.fill()
    }
    
    func shapeRosette() {
        let size = self.bounds.size

        // Calculate the points of the figure
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = (size.width / 4)
        let p0 = CGPoint(x: center.x, y: center.y - radius)
        let p1 = CGPoint(x: center.x - radius, y: center.y)
        let p2 = CGPoint(x: center.x + radius, y: center.y)
        let p3 = CGPoint(x: center.x, y: center.y + radius)
        
        // Calculate angles (in radians)
        // An angle of 360° equals 2π radians
        let startAngle = CGFloat(0)
        let endAngle = 2 * CGFloat.pi
        
        // Create the path
        let circle1 = UIBezierPath()
        circle1.move(to: p0)
        circle1.addArc(withCenter: p0, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle1.close()
        
        let circle2 = UIBezierPath()
        circle2.move(to: p1)
        circle2.addArc(withCenter: p1, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle2.close()
        
        let circle3 = UIBezierPath()
        circle3.move(to: p2)
        circle3.addArc(withCenter: p2, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle3.close()
        
        let circle4 = UIBezierPath()
        circle4.move(to: p3)
        circle4.addArc(withCenter: p3, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle4.close()
        
        let circle5 = UIBezierPath()
        circle5.move(to: center)
        circle5.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        circle5.close()
        
        colorShape.setFill()
        circle1.fill()
        circle2.fill()
        circle3.fill()
        circle4.fill()
        
        let c1 = CAShapeLayer()
        c1.path = circle1.cgPath
        c1.fillColor = UIColor.blue.cgColor
        
        let c2 = CAShapeLayer()
        c2.path = circle2.cgPath
        c2.fillColor = UIColor.red.cgColor
        
        let c3 = CAShapeLayer()
        c3.path = circle3.cgPath
        c3.fillColor = UIColor.green.cgColor
        
        let c4 = CAShapeLayer()
        c4.path = circle4.cgPath
        c4.fillColor = UIColor.magenta.cgColor
        
        let c5 = CAShapeLayer()
        c5.path = circle5.cgPath
        c5.fillColor = colorShape.cgColor
        
        layer.addSublayer(c1)
        layer.addSublayer(c2)
        layer.addSublayer(c3)
        layer.addSublayer(c4)
        layer.addSublayer(c5)
    }
    
    func shapePieChart() {
        layer.sublayers?.removeAll()
        let size = self.bounds.size

        // Calculate the points of the figure
        let p0 = self.bounds.origin
        let center = CGPoint(x: p0.x + size.width / 2, y: p0.y + size.height / 2)
        let radius = (min(size.width, size.height) / 2)
        
        // Calculate angles (in radians)
        // The calculation of degrees to radians is: degrees * pi / 180, so
        // Indicates the degree where the arc path will begin
        let angle1:CGFloat = 0
        // Indicates the final degree of arc travel
        let angle2:CGFloat = 45
        // Calculate radians
        let startAngle = angle1 * .pi / 180
        let endAngle = angle2 * .pi / 180
        
        // Create the path
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        
        colorShape.setFill()
        path.fill()
    }
    
    func shapeBeizer() {
        layer.sublayers?.removeAll()
        let size = self.bounds.size

        // Calculate the points of the figure
        let p0 = self.bounds.origin
        let halfStart = CGPoint(x: p0.x + 10, y: size.height / 2)
        let halfEnd = CGPoint(x: size.width - 10, y: halfStart.y)
        
        // Create the path
        let path = UIBezierPath()
        path.move(to: halfStart)
        path.addArc(withCenter: halfStart, radius: 4, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        path.move(to: halfStart)
        
        for i in 0..<points.count {
            path.addCurve(to: points[i], controlPoint1: controlPoints[i][0], controlPoint2: controlPoints[i][1])
            path.move(to: points[i])
            path.addArc(withCenter: points[i], radius: 4, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            path.move(to: points[i])
            
        }
        let pc1 = CGPoint(x: size.width - controlPoints[0][1].x, y: controlPoints[0][1].y)
        let pc2 = CGPoint(x: size.width - controlPoints[0][0].x, y: controlPoints[0][0].y)
        path.addCurve(to: halfEnd, controlPoint1: pc1, controlPoint2: pc2)
        path.addArc(withCenter: halfEnd, radius: 4, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        colorShape.setFill()
        path.lineWidth = 5
        path.fill()
    }
}
