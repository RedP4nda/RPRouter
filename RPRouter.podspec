#
# Be sure to run `pod lib lint RPRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RPRouter'
  s.version          = '0.1.0'
  s.summary          = 'Routing made easy.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simply route to deep content of your application with RPRouter, navigate from any app to your content with url scheme requests, from anywhere within your app of from app shortcuts !
                       DESC

  s.homepage         = 'https://github.com/redp4nda/RPRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mrcloud' => 'florianp37@me.com' }
  s.source           = { :git => 'https://github.com/redp4nda/RPRouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RPRouter/Classes/**/*'

  # s.resource_bundles = {
  #   'RPRouter' => ['RPRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Compass', '~> 5.0.0'
  s.dependency 'RPFramework', '~> 0.9.1'

end
