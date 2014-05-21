Pod::Spec.new do |s|
  s.name             = "MWButtonGroup"
  s.version          = "0.0.1"
  s.summary          = "a UIView subclass managing a group of buttons"
  s.description      = <<-DESC
                       MWButtonGroup manages a group of buttons

                       * it can be configured for multipe or single select 
                       * button colors can be adjusted
                       DESC
  s.homepage         = "https://github.com/zliw/MWButtonGroup"
  s.screenshots      = "https://raw.githubusercontent.com/zliw/MWButtonGroup/master/screenshot.png"
  s.license          = 'MIT'
  s.author           = { "Martin Wilz" => "github@wilz.de" }
  s.source           = { :git => "https://github.com/zliw/MWButtonGroup.git", :tag => "0.1.0" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.public_header_files = 'Classes/*.h'
end
