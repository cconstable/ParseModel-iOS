Pod::Spec.new do |s|
  s.name         = "ParseModel"
  s.version      = "1.2.1"
  s.summary      = "Hassel-free data models for the Parse iOS SDK."
  s.description  = "Create your properties with @dynamic and ParseModel automatically maps them to a PFObject or PFUser. Alternative to PFObject subclassing."
  s.homepage     = "https://github.com/FuturaIO/ParseModel-iOS"
  s.license      = {
    :type => 'Apache',
    :text => "http://www.apache.org/licenses/LICENSE-2.0.html"
  }
  s.authors      = { "Christopher Constable" => "chris@futura.io" }
  s.source       = { :git => "https://github.com/FuturaIO/ParseModel-iOS.git", :tag => "1.2.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'ParseModel/**/*.{h,m}'
  s.requires_arc = true
  s.dependency 'Parse'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Parse"' }
end
