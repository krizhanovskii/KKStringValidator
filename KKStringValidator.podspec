#
# Be sure to run `pod lib lint KKStringValidator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KKStringValidator'
  s.version          = '0.1.4'
s.summary          = 'Library for easy and fastest string validation based on сciterias.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = "For project to project you must validate some input fields, strings, etc, for thay accept some criterias (like length, exist uppercase char, exist number, etc).
KKStringValidator helps to check string for needed criterias to be accepted."

s.homepage         = "https://github.com/krizhanovskii"
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = 'MIT'
s.author           = { "k.krizhanovskii" => "k.krizhanovskii@gmail.com" }
s.source           = { :git => "https://github.com/krizhanovskii/KKStringValidator.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KKStringValidator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KKStringValidator' => ['KKStringValidator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
