//
//  BGFoundationFunction.swift
//  BGFoundationKitDemo
//
//  Created by user on 15/10/15.
//  Copyright © 2015年 BG. All rights reserved.
//

import UIKit

// MARK: - color
public func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor{
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

/**
 十六进制返回颜色
 
 - parameter hexColor: 十六进制数
 
 - returns: 返回颜色对象
 */
public func UIColorFromHexColor(hexColor: Int) ->UIColor {
    return UIColor(red: CGFloat((hexColor & 0xFF0000)>>16)/255.0, green: CGFloat((hexColor&0xFF00)>>8)/255.0, blue: CGFloat(hexColor&0xFF)/255.0, alpha: 1.0)
}

func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}

func CGPointMake(_ x: CGFloat, _ y: CGFloat) -> CGPoint {
    return CGPoint(x: x, y: y)
}

func CGSizeMake(_ width: CGFloat, _ height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
}
