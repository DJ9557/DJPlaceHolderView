Pod::Spec.new do |s|

  s.name         = "DJPlaceHolderView"
  s.version      = "1.0.0"
  s.platform     = :ios, "10.0"

  s.summary      = "占位图"
  s.homepage     = "https://github.com/DJ9557/DJPlaceHolderView"
  s.license              = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "DJ9557" => "dj9557@163.com" }
  s.source       = { :git => "https://github.com/DJ9557/DJPlaceHolderView.git", :tag => "1.0.0" }
  s.source_files  = "DJPlaceHolderView/*.{h,m}"
  s.resource_bundles = {
        'Resource' => ['Assets/*']
    }
  s.requires_arc = true

end
