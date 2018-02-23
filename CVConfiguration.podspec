Pod::Spec.new do |s|
  s.name         = 'CVConfiguration'
  s.version      = '2.0'
  s.summary      = 'UIkit的语法糖,链式写法'
  s.homepage     = 'https://github.com/kuah/CVConfiguration'
  s.author       = "CT4 => 284766710@qq.com"
  s.source       = {:git => 'https://github.com/kuah/CVConfiguration.git', :tag => "#{s.version}"}
  s.source_files = "source/**/*.{h,m}"
  s.requires_arc = true
  s.libraries = 'z'
  s.ios.deployment_target = '8.0'
  s.license = 'MIT'
  s.frameworks = 'UIKit'
  s.dependency 'UITextView-Kuah', '~> 0.4'
end
