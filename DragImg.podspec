#
# Be sure to run `pod lib lint DragImg.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DragImg'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DragImg.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/songxing10000/DragImg'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'songxing10000' => 'songxing10000@live.cn' }
  s.source           = { :git => 'https://github.com/songxing10000/DragImg.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform = :osx
  s.osx.deployment_target = "10.15"
  s.swift_versions = ['5.0']

  s.source_files = 'DragImg/Classes/**/*'
  s.resource_bundles = {
      'DragImg' => ['DragImg/Assets/**/*.{xcassets,json}', 'DragImg/Assets/*.{xib}']
  }
  # s.resource_bundles = {
  #   'DragImg' => ['DragImg/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'xUtils'
  s.dependency 'xViews'
end
