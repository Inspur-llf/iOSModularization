

Pod::Spec.new do |spec|

 

  spec.name         = "iOSModularization"
  spec.version      = "1.0.2"
  spec.summary      = "A short description of iOSModularization."

  spec.description  = <<-DESC
  一个测试打包的cocoapods项目
 DESC

  spec.homepage     = "https://github.com/Inspur-llf/iOSModularization"
  
  spec.license      = "MIT"

  spec.author             = { "lingfei li" => "lilingfei@inspur.com" }

  spec.source       = { :git => "https://github.com/Inspur-llf/iOSModularization.git", :tag => "#{spec.version}" }

  spec.source_files  = "*.{h,m}"
  

  

end
