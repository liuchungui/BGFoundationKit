//
//  UIImage+BGExtension.swift
//  BGFoundationKitDemo
//
//  Created by user on 15/10/15.
//  Copyright © 2015年 BG. All rights reserved.
//

import UIKit

public extension UIImage {
    /**
     类方法，通过颜色获取一张图片
     
     - parameter color: 颜色
     - parameter size:  生成图片尺寸大小
     
     - returns: 返回一张图片
     */
    public static func image(_ color: UIColor, _ size: CGSize) -> UIImage{
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
