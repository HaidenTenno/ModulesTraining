#global config
platform :ios, '15.0'
use_frameworks!
workspace 'ModularApp'

def alamofore
  pod 'Alamofire', '~> 5.5'
end

#targets
target 'Main' do
  project 'Main/Main'
  alamofore
end

target 'StylesResources' do
  project 'Frameworks/StylesResources/StylesResources'
  alamofore
end

target 'Playground' do
  project 'Frameworks/Playground/Playground'
  alamofore
end

target 'Profile' do
  project 'Frameworks/Profile/Profile'
  alamofore
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
          config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "15.0"
      end
  end
end