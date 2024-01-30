#
# Be sure to run `pod lib lint StackCardView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackCardView'
  s.version          = '0.1.0'
  s.summary          = 'UI component for stack of cards'
  s.description      = 'SwiftUI component for displaying the list of cards with swipe gesutures and button actions'
  s.homepage         = 'https://github.com/badrinathvm/StackCardView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Badarinath Venkatnarayansetty' => 'badrinathvm@gmail.com' }
  s.source           = { :git => 'https://github.com/badrinathvm/StackCardView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/badrivm'
  s.ios.deployment_target = '14.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.source_files     = 'Sources/**/*.swift'
  
  # s.resource_bundles = {
  #   'StackCardView' => ['StackCardView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
