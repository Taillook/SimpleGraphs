Pod::Spec.new do |s|
  s.name         = "SimpleGraphs"
  s.version      = "0.0.4"
  s.summary      = "Draw a SimpleGraph."
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/Taillook/SimpleGraphs"
  s.author       = { "Taillook" => "Taillook.S[at]gmail.com" }
  s.social_media_url   = "http://twitter.com/Taillook"
  s.source       = { :git => "https://github.com/Taillook/SimpleGraphs.git", :tag => "0.0.4" }
  s.platform     = :ios, '10.2'
  s.requires_arc = true
  s.source_files = 'SimpleGraphs/*.swift'
end
