platform :ios, '8.0'
use_frameworks!
target 'PasswordNote' do

pod 'IQKeyboardManagerSwift'
pod 'PopupDialog'
pod 'SnapKit', '~> 3.2.0'
pod 'RealmSwift'
pod 'PKHUD'
pod 'SwiftLint', '~> 0.24.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end