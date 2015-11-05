Pod::Spec.new do |spec|
  #项目名称
  spec.name         = 'BGFoundationKit'
  #版本号
  spec.version      = '0.0.2'
  #开源协议
  spec.license      = 'MIT'
  #对开源项目的描述
  spec.summary      = 'BGFoundationKit是一个swift基础框架'
  #开源项目的首页
  spec.homepage     = 'https://github.com/liuchungui/BGFoundationKit'
  #作者信息
  spec.author       = {'chunguiLiu' => '404468494@qq.com'}
  #项目的源和版本号
  spec.source       = { :git => 'https://github.com/liuchungui/BGFoundationKit.git', :tag => spec.version }
  #源文件，这个就是供第三方使用的源文件
  spec.source_files = "BGFoundationKit/*.swift"
  #适用于ios7及以上版本
  spec.platform     = :ios, '8.0'
  #使用的是ARC
  spec.requires_arc = true

  spec.subspec 'BGExtension' do |ss|
    ss.source_files = "BGFoundationKit/Extension/*.swift"
  end
end