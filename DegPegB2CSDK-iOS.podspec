#
# Be sure to run `pod lib lint DegPegB2CSDK-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DegPegB2CSDK-iOS'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DegPegB2CSDK-iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'degpegsdk is an awesome pod aimed to make yor life easier around UIScrollViews.'
                       DESC

  s.homepage         = 'https://github.com/degpeg-media/degpeg-b2c-sdk-ios.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'degpeg-media' => 'rakesh.kumar@degpeg.com' }
  s.source           = { :git => 'https://github.com/degpeg-media/degpeg-b2c-sdk-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.source_files = 'Source/**/*.swift'
  s.swift_versions = '5.0'
  s.platforms = {
      "ios": "12.0"
  }

# s.resource_bundles = {
#   'DScrollView' => ['DScrollView/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
# s.dependency 'AFNetworking', '~> 2.3'

  s.dependency 'TinyConstraints', '~> 4.0.0'
end
