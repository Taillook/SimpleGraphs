//
//  UIColor.swift
//  GreenShift
//
//  Created by Taillook on 2017/02/04.
//  Copyright © 2017年 SP2LC. All rights reserved.
//

import UIKit

/*
 Usage
 
 RGB
 UIColor.rgb(r:255, g:255, b: 255, alpha: 1)
 Hex
 UIColor.hex(hexStr: "#FFFFFF", alpha: 1)
 */
extension UIColor {
    class func rgb(r: Int, g: Int, b: Int, alpha: CGFloat) -> UIColor{
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    class func hex ( hexStr : NSString, alpha : CGFloat) -> UIColor {
        var hexStr = hexStr
        let alpha = alpha
        hexStr = hexStr.replacingOccurrences(of: "#", with: "") as NSString
        
        if String(hexStr).characters.count == 3 {
            var newHexStr = ""
            for c in String(hexStr).characters {
                newHexStr += "\(c)\(c)"
            }
            hexStr = newHexStr as NSString
        }
        
        let scanner = Scanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.white
        }
    }
}
