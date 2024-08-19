Pod::Spec.new do |s|
  s.name         = 'TGCoreKit'
  s.version      = '0.0.1'
  s.summary      = '基础库'
  s.homepage     = 'https://github.com/yourname/YourFramework'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Your Name' => 'your.email@example.com' }
  s.source       = { :git => 'https://github.com/yourname/YourFramework.git', :tag => s.version.to_s }
  
  s.platform     = :ios, '10.0'
  s.source_files  = 'TGCoreKit/**/*.{h,m,swift}' # 根据你的文件结构调整
  s.requires_arc = true

  # 添加任何其他依赖项
  # s.dependency 'AnotherPod'
end
