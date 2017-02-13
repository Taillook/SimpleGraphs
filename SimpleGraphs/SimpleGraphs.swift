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
    var isDrawGrid: Bool = false
    var lineWidth: CGFloat = 3
    var lineColor: UIColor = UIColor.blue
    var circleWidth: CGFloat = 4
    var circleColor: UIColor = UIColor.blue
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
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0
        
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
        let line: UIBezierPath = UIBezierPath()
        for (index, i) in plotY.enumerated() {
            if index == 0 {
                line.move(to: CGPoint(x: CGFloat(index) * scaleMargin, y: i))
            }else {
                line.addLine(to: CGPoint(x: CGFloat(index) * scaleMargin, y: i))
            }
        }
        line.lineWidth = lineWidth
        line.stroke()
    }
    
    var yMin0Difference: CGFloat {
        return CGFloat(0)-yData.min()!
    }
    
    var yMaxViewMaxDifference: CGFloat {
        return CGFloat(self.bounds.height)/yData.max()!
    }
    
}
