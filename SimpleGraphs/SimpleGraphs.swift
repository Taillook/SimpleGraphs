//
//  SimpleGraphs.swift
//  SimpleGraphs
//
//  Created by Taillook on 2017/02/12.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import Foundation
import UIKit

open class LineGraph: UIView{
    var isDrawGrid: Bool = true
    var lineWidth: CGFloat = 3
    var lineColor: UIColor = UIColor.hex(hexStr: "#007000", alpha: 1)
    var circleWidth: CGFloat = 4
    var circleColor: UIColor = UIColor.green
    var xData: [Any] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var yData: [CGFloat] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var plotY: [CGFloat] = []
    var scaleMargin: CGFloat = 10
    var graphWidth: CGFloat = 300
    var graphHeight: CGFloat = 300
    
    
    
    convenience init(frame: CGRect, xData: [Any], yData: [CGFloat]) {
        self.init(frame: frame)
        self.xData = xData
        self.yData = yData
        self.backgroundColor = UIColor.white
        self.scaleMargin = frame.width/CGFloat(xData.count-1)
        self.layer.borderColor = UIColor.hex(hexStr: "#DCDCDC", alpha: 1).cgColor
        self.layer.borderWidth = 1
        
        setUp()
    }
    
    func setUp(){
        //ViewHeight match yData
        for i in yData {
            plotY.append(i * yMaxViewMaxDifference)
        }
        
        self.transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    
    override open func draw(_ rect: CGRect) {
        if isDrawGrid {
            drawGrid()
        }
        let line: UIBezierPath = UIBezierPath()
        for (index, i) in plotY.enumerated() {
            if index == 0 {
                line.move(to: CGPoint(x: CGFloat(index) * scaleMargin, y: i))
            }else {
                line.addLine(to: CGPoint(x: CGFloat(index) * scaleMargin, y: i))
            }
        }
        line.lineWidth = lineWidth
        lineColor.setStroke()
        line.stroke()
    }
    
    func drawGrid(){
        let dashes:[CGFloat] = [1,2]
        let line: UIBezierPath = UIBezierPath()
        
        for i in 0...Int(self.bounds.height) {
            if i == 0 {
                line.move(to: CGPoint(x: 0, y: CGFloat(i)))
                line.addLine(to: CGPoint(x: self.bounds.width, y: CGFloat(i)))
                line.lineWidth = 1
                UIColor.gray.setStroke()
                line.setLineDash(dashes, count: dashes.count, phase: 0)
                line.stroke()
            }else {
                if i % 10 == 0 {
                    line.move(to: CGPoint(x: 0, y: CGFloat(i)))
                    line.addLine(to: CGPoint(x: self.bounds.width, y: CGFloat(i)))
                    line.lineWidth = 1
                    UIColor.gray.setStroke()
                    line.setLineDash(dashes, count: dashes.count, phase: 0)
                    line.stroke()
                }
            }
        }
        
        for i in 0...Int(self.bounds.width) {
            if i == 0 {
                line.move(to: CGPoint(x: CGFloat(i), y: 0))
                line.addLine(to: CGPoint(x: CGFloat(i), y: self.bounds.height))
                line.lineWidth = 1
                UIColor.gray.setStroke()
                line.setLineDash(dashes, count: dashes.count, phase: 0)
                line.stroke()
            }else {
                if i % 10 == 0 {
                    line.move(to: CGPoint(x: CGFloat(i), y: 0))
                    line.addLine(to: CGPoint(x: CGFloat(i), y: self.bounds.height))
                    line.lineWidth = 1
                    UIColor.gray.setStroke()
                    line.setLineDash(dashes, count: dashes.count, phase: 0)
                    line.stroke()
                }
            }
        }
        
    }
    
    var yMaxViewMaxDifference: CGFloat {
        return CGFloat(self.bounds.height)/yData.max()!
    }
    
}
