Pod::Spec.new do |s|

  s.name         = "MKHStateCtrl"
  s.version      = "1.0.0"
  s.summary      = "General purpose state controller for Cocoa objects."
  s.homepage     = "https://github.com/maximkhatskevich/MKHStateCtrl"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Maxim Khatskevich" => "maxim.khatskevich@gmail.com" }

  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.6"

  s.source       = { :git => "https://github.com/maximkhatskevich/MKHStateCtrl.git", :tag => "#{s.version}" }
  
  s.framework = "Foundation"
  s.requires_arc = true
  
  s.source_files  = "Src/*.{h,m}"

end
