source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!

def test_pods
    inherit! :search_paths
end

target 'WhereIsABC' do
    
    pod 'Firebase/Analytics'
    pod 'Firebase/Crashlytics'
    pod 'Google-Mobile-Ads-SDK'

    target 'WhereIsABCTests' do
        test_pods
    end
    
    target 'WhereIsABCUITests' do
        test_pods
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.1'
        end
    end
end
