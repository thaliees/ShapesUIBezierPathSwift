//
//  ViewController.swift
//  ShapesUIBezierPath
//
//  Created by Thaliees on 1/15/20.
//  Copyright © 2020 Thaliees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewShape: ShapeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ticketAction(_ sender: UIButton) {
        viewShape.colorShape = .cyan
        viewShape.name = "Ticket"
        viewShape.setNeedsDisplay()
    }
    
    @IBAction func markAction(_ sender: UIButton) {
        viewShape.colorShape = .blue
        viewShape.name = "Mark"
        viewShape.setNeedsDisplay()
    }
    
    @IBAction func rosetteAction(_ sender: UIButton) {
        viewShape.colorShape = .black
        viewShape.name = "Rosette"
        viewShape.setNeedsDisplay()
    }
    
    @IBAction func pieChartAction(_ sender: UIButton) {
        viewShape.colorShape = .yellow
        viewShape.name = "PieChart"
        viewShape.setNeedsDisplay()
    }
    
    @IBAction func bellAction(_ sender: UIButton) {
        viewShape.colorShape = .purple
        viewShape.name = "Beizer"
        let size = viewShape.bounds.size
        
        let p1 = CGPoint(x: size.width / 4, y: (size.height / 2) - 20)
        let p2 = CGPoint(x: size.width / 2, y: size.height / 4)
        let p3 = CGPoint(x: size.width - p1.x, y: p1.y)
        viewShape.points = [ p1, p2, p3 ]
        viewShape.controlPoints = [
            [ CGPoint(x: ((p1.x - 10) / 2) - 2, y: p1.y + 18), CGPoint(x: (p1.x / 2) + 10, y: p1.y + 16) ],
            [ CGPoint(x: p1.x + 10, y: p1.y - 80), CGPoint(x: p1.x + 30, y: p2.y + 20) ],
            [ CGPoint(x: p3.x - 30, y: p2.y + 20), CGPoint(x: p3.x - 10, y: p1.y - 80) ] ]
        viewShape.setNeedsDisplay()
    }
}
