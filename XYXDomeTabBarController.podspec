Pod::Spec.new do |s|

  s.name         = "XYXDomeTabBarController"
  s.version      = "1.1.0"
  s.summary      = "An easy way to create iOS tabBarController with/without dome button."
  s.description  = <<-DESC
  开发者可以通过继承XYXDomeTabBarController来快速生成带凸起按钮的TabBarController, 也可直接生成普通的.
  可以设置凸起按钮domeButton的image以及highlightedImage, 重写它的点击事件domeButtonClicked(_ :).
  凸起按钮的位置可以通过domeIndex自定义,凸起按钮的大小也可以通过domeBar.domeButtonSize来自定义.
                   DESC

  s.homepage     = "https://github.com/uMina/XYXDomeTabBarController"
  s.screenshots = "https://github.com/uMina/XYXDomeTabBarController/raw/master/ReadMe/aa.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Teresa" => "yxx.umina@gmail.com" }
  s.social_media_url   = "https://umina.github.io/"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/uMina/XYXDomeTabBarController.git", :tag => "#{s.version}" }
  s.source_files = "XYXDomeTabBarController/*.swift"
  s.resources  = "XYXDomeTabBarController/bundle/*.png"
  s.requires_arc = true
  `echo "4.0" > .swift-version`

end
