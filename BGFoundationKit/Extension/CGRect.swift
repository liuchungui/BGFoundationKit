//
//  CGRect+BGExtension.swift
//  BGSimpleImageSelectCollectionView
//
//  Created by user on 15/10/29.
//  Copyright © 2015年 BG. All rights reserved.
//

import UIKit

public extension CGRect {
    
    public var left: CGFloat {
        get {
            return self.origin.x
        }
        set (newValue){
            self.origin.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return self.origin.x + self.size.width
        }
        set (newValue){
            self.origin.x = newValue - self.size.width
        }
    }
    
    public var top: CGFloat {
        get {
            return self.origin.y
        }
        set (newValue){
            self.origin.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return self.origin.y + self.size.height
        }
        set (newValue){
            self.origin.y = newValue - self.size.height
        }
    }
    
    public var width: CGFloat {
        get {
            return self.size.width
        }
        set (newValue) {
            self.size.width = newValue
        }
    }
    
    public var height: CGFloat {
        get {
            return self.size.height
        }
        set (newValue) {
            self.size.height = newValue
        }
    }
    
    public var center: CGPoint {
        get {
            return CGPointMake(self.origin.x+self.size.width/2.0, self.origin.y+self.size.height/2.0)
        }
        set (newValue) {
            self.origin = CGPointMake(newValue.x-self.size.width/2.0, newValue.y-self.size.height/2.0)
        }
    }
    
    public var centerX: CGFloat {
        get {
            return self.origin.x+self.size.width/2.0
        }
        set (newValue) {
            self.origin.x = newValue-self.size.width/2.0
        }
    }
    
    public var centerY: CGFloat {
        get {
            return self.origin.y+self.size.height/2.0
        }
        set (newValue) {
            self.origin.y = newValue-self.size.height/2.0
        }
    }

    
}
