//
//  UIView+BGExtension.swift
//  BGFoundationKitDemo
//
//  Created by user on 15/10/15.
//  Copyright © 2015年 BG. All rights reserved.
//

import UIKit

public extension UIView {
    /** 重用的标示，默认以类名为标示 */
    public class func reuseIdentify() -> String {
        return String(describing: type(of:self))
    }
    
    /** 加载xib文件 */
    public static func loadFromXib() -> Any {
        let array = Bundle.main.loadNibNamed(String(describing: type(of:self)), owner: self, options: nil)
        return array!
    }
    
    public var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set (newValue){
            self.frame.origin.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set (newValue){
            self.frame.origin.x = newValue - self.frame.size.width
        }
    }
    
    public var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set (newValue){
            self.frame.origin.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.frame.size.height
        }
        set (newValue){
            self.frame.origin.y = newValue - self.frame.size.height
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set (newValue) {
            self.frame.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set (newValue) {
            self.frame.size.height = newValue
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set (newValue) {
            self.center.x = newValue
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set (newValue) {
            self.center.y = newValue
        }
    }
    
}
