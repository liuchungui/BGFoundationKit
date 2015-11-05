//
//  BGBaseViewController.swift
//  BGPhotoPickerControllerDemo
//
//  Created by user on 15/10/14.
//  Copyright © 2015年 BG. All rights reserved.
//

import UIKit
import Foundation

public enum BGNavigationBarStatus: Int {
    /** 系统默认 */
    case Default
    /** 不透明 */
    case Opaque
    /** 半透明导航栏，透明度为0.3 */
    case Translucent
    /** 完全透明 */
    case Transparent
    /** 隐藏导航栏 */
    case Hide
}

//私有常量
private let kNavigationBarStatusKey = "kNavigationBarStatusKey"

public class BGBaseViewController: UIViewController {
    //MARK: - property
    var navigationBarStatus: BGNavigationBarStatus
    /** 是否默认显示左边返回按钮 */
    private var isShowLeftBackButton: Bool = false
    /// 是否显示左边返回按钮
    public var showLeftBackButton: Bool {
        get {
            return isShowLeftBackButton
        }
        set (newValue) {
            isShowLeftBackButton = newValue
            if self.isViewLoaded() {
                self.configureNavigationItem()
            }
        }
    }
    
    //MARK: - init method
    /**
    导航栏选择默认状态
    */
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.navigationBarStatus = BGNavigationBarStatus.Default
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    /**
    让它默认加载类名为主的xib文件
    */
    convenience init() {
        /// 初始化方法获取类名，只能通过dynamicType获取
        var nibNameOrNil: String? = String(self.dynamicType)
        if NSBundle.mainBundle().pathForResource(String(self.dynamicType), ofType: "nib") == nil {
            nibNameOrNil = nil
        }
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    // MARK: - NSCoding protocol method
    override public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(self.navigationBarStatus.rawValue, forKey: kNavigationBarStatusKey)
        super.encodeWithCoder(aCoder)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.navigationBarStatus = BGNavigationBarStatus.Opaque
        super.init(coder: aDecoder)
    }
    
    // MARK: - view lifecycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationItem()
    }
    
    override public func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar()
    }
    
    // MARK: - navigation bar, item, title
    func configureNavigationBar(){
        self.automaticallyAdjustsScrollViewInsets = false
        switch(self.navigationBarStatus) {
        case .Hide:
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        case .Opaque:
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationController?.navigationBar.translucent = false
            self.edgesForExtendedLayout = UIRectEdge.None
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.image(RGB(248, 208, 15, 1.0), size: CGSizeMake(BGMainScreenWidth, 128)), forBarMetrics: UIBarMetrics.Default)
        case .Translucent, .Transparent:
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.navigationController?.navigationBar.translucent = true
            self.edgesForExtendedLayout = UIRectEdge.All
            var alpha = CGFloat(0)
            if self.navigationBarStatus == BGNavigationBarStatus.Translucent {
                alpha = 0.3
            }
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.image(RGB(0, 0, 0, alpha), size: CGSizeMake(BGMainScreenWidth, 128)), forBarMetrics: UIBarMetrics.Default)
        default:
            break
        }
    }
    
    func configureNavigationItem() {
        if self.showLeftBackButton {
            self.navigationItem.leftBarButtonItem = self.letBarButtonItem(UIImage(named:"nav_back.png")!, action: Selector("leftNavigatioItemAction"))
        }
        else {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    /** 设置导航栏标题 */
    public func setNavTitle(title: String) {
        let titleView = UIView(frame: CGRectMake(0, 0, BGMainScreenWidth, 44))
        
        let titleLabel = UILabel(frame: CGRectMake(0, 0, BGMainScreenWidth, 44))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        titleLabel.textAlignment = NSTextAlignment.Center
        
        let width = titleLabel.sizeThatFits(CGSizeMake(BGMainScreenWidth, 44)).width
        let maxWidth = CGFloat(120)
        if width <= BGMainScreenWidth-2.0*maxWidth {
            titleLabel.frame = CGRectMake(0, 0, BGMainScreenWidth-maxWidth*2, 44);
            titleView.frame = CGRectMake(maxWidth, 0, BGMainScreenWidth-maxWidth*2, 44);
        }
        else {
            let leftViewbounds = self.navigationItem.leftBarButtonItem?.customView?.bounds
            let rightViewbounds = self.navigationItem.rightBarButtonItem?.customView?.bounds;
            var maxWidth = leftViewbounds!.width > rightViewbounds!.width ? leftViewbounds!.width : rightViewbounds!.width
            maxWidth += 15;
            titleLabel.frame.size.width = BGMainScreenWidth - maxWidth * 2;
            titleView.frame.size.width = BGMainScreenWidth - maxWidth * 2;
        }
        //设置标题，添加父视图
        titleLabel.text = title;
        titleView.addSubview(titleLabel)
        self.navigationItem.titleView = titleView;
    }
    
    public func letBarButtonItem(normalImage: UIImage, action: Selector, selectImage:UIImage? = nil) -> UIBarButtonItem {
        return self.buttonItem("", action: action, titleColor: UIColor.whiteColor(), normalImage: normalImage, selectImage: nil, isLeftItem: true)
    }
    
    public func rightBarButtonItem(normalImage: UIImage, action: Selector, selectImage:UIImage? = nil) -> UIBarButtonItem {
        return self.buttonItem("", action: action, titleColor: UIColor.whiteColor(), normalImage: normalImage, selectImage: nil, isLeftItem: false)
    }
    
    public func buttonItem(normalImage: UIImage, action: Selector, selectImage:UIImage? = nil, isLeftItem: Bool = true) -> UIBarButtonItem {
        return self.buttonItem("", action: action, titleColor: UIColor.whiteColor(), normalImage: normalImage, selectImage: nil, isLeftItem: isLeftItem)
    }
    
    public func buttonItem(title: String, action: Selector, titleColor:UIColor = UIColor.whiteColor(), normalImage: UIImage? = nil, selectImage:UIImage? = nil, isLeftItem: Bool = true) -> UIBarButtonItem {
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(titleColor, forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        button.exclusiveTouch = true
        button.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        if let image = normalImage {
            button.setImage(image, forState: UIControlState.Normal)
        }
        if let image = selectImage {
            button.setImage(image, forState: UIControlState.Highlighted)
        }
        //设置frame
        let buttonSize = button.sizeThatFits(CGSize(width: BGMainScreenWidth, height: 44.0))
        button.frame = CGRect(x: 0, y: 0, width: buttonSize.width+10, height: 44.0)
        
        //设置偏移量
        if isLeftItem {
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        }
        else {
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        }
        
        //创建barButtonItem
        let buttonItem = UIBarButtonItem(customView: button)
        return buttonItem
    }
    
    public func leftNavigatioItemAction (){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
