# BGFoundationKit
##1、屏幕尺寸的常量
```
 /// 屏幕bounds
let MainScrrenBounds = UIScreen.mainScreen().bounds
 /// 屏幕大小
let MainScrrenSize = UIScreen.mainScreen().bounds.size
 /// 屏幕宽度
let MainScreenWidth = UIScreen.mainScreen().bounds.width
 /// 屏幕高度
let MainScreenHeight = UIScreen.mainScreen().bounds.height
```
示例：

```
let collectionView = UICollectionView(frame: CGRect(x: 0, y: 100, width: MainScreenWidth, height: MainScreenHeight-100), collectionViewLayout: layout)
```

##2、工具方法
####颜色
示例：

```
//RGB设置颜色
self.previewButton.setTitleColor(RGB(170, 170, 170), forState: UIControlState.Normal)
//十六进制设置颜色
cell.imageView.backgroundColor = UIColorFromHexColor(0xFFFF00)
```

##3、Extension
####UIView+BGExtension.swift
示例：

```
//视图顶部
view.top = 100
//视图底部
view.bottom = 500
//视图左边
view.left = 200
//视图右边
view.right = 200
//视图宽度
view.width = 100
//视图高度
view.height = 300
//视图中心X坐标
view.centerX = 100
//视图中心点Y坐标
view.centerY = 150
//加载以类名命名的xib文件
let subView = UIView.loadFromXib()
```
####CGRect+BGExtension.swift
```
//frame顶部
view.frame.top = 100
//frame底部
view.frame.bottom = 500
//frame左边
view.frame.left = 200
//frame右边
view.frame.right = 200
//frame宽度
view.frame.width = 100
//frame高度
view.frame.height = 300
//frame中心点
view.frame.center = CGPoint(100, 100)
//frame中心X坐标
view.frame.centerX = 100
//frame中心点Y坐标
view.frame.centerY = 150
```
####UIImage+BGExtension.swift
```
//通过颜色生成一张图片
let image = UIImage.image(RGB(248, 208, 15, 1.0)
```
####UITableViewCell+BGExtension.swift
```
//reuseIdentify，通过类名来获取cell的xib文件
let cell: BGPhotoPreviewCell = collectionView.dequeueReusableCellWithReuseIdentifier(BGPhotoPreviewCell.reuseIdentify(), forIndexPath: indexPath) as! BGPhotoPreviewCell
```

##4、Base
####BGBaseViewController.swift
默认ViewController不会加载xib文件，添加下面的初始化方法之后，就会自动加载控制器名的xib文件

```
 //MARK: - init method
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.navigationBarStatus = BGNavigationBarStatus.Default
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    //让它默认加载类名为主的xib文件
    convenience init() {
        var nibNameOrNil: String? = String(self.dynamicType)
        if NSBundle.mainBundle().pathForResource(String(self.dynamicType), ofType: "nib") == nil {
            nibNameOrNil = nil
        }
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    // MARK: - NSCoding protocol method
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(self.navigationBarStatus.rawValue, forKey: kNavigationBarStatusKey)
        super.encodeWithCoder(aCoder)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.navigationBarStatus = BGNavigationBarStatus.Opaque
        super.init(coder: aDecoder)
    }
```