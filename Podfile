# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Gallify' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Gallify

    # Add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'

    # For Analytics without IDFA collection capability, use this pod instead
    # pod ‘Firebase/AnalyticsWithoutAdIdSupport’

    # Add the pods for any other Firebase products you want to use in your app
    # For example, to use Firebase Authentication and Cloud Firestore
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'Firebase/Core'
  pod 'FirebaseUI'
  pod 'FirebaseUI/Storage'
  pod 'FirebaseFirestoreSwift'
  

    # For images
  pod 'SDWebImageSwiftUI'
   
    # Search - Algolia
  pod 'AlgoliaSearchClient', '~> 8.10'

  inhibit_all_warnings!

  target 'GallifyTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GallifyUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end

end
