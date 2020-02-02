Pod::Spec.new do |spec|

  spec.name         = "ToastAlerts"
  spec.version      = "3.0"
  spec.summary      = "A library to display Toast Alerts in iOS."

  spec.description  = <<-DESC
  A library to display Toast Alerts in in iOS
  Toast View with Message & Image
  Toast View with Time Dismiss
  Toast View with Tap Dismiss
  Custom Toast View
                   DESC

  spec.homepage     = "https://github.com/estampworld/ios-toast-alerts"


  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Eduardo Irías" => "eduardoirias@me.com" }
  spec.swift_version = '5.0'
  spec.platform     = :ios
  spec.ios.deployment_target = '11.0'

  spec.source       = { :git => "https://github.com/estampworld/ios-toast-alerts.git", :tag => spec.version.to_s  }

  spec.source_files  = "Sources/ToastAlerts/*.swift"
  spec.ios.source_files = 'Sources/ToastAlerts/*.swift'
  spec.exclude_files = "Classes/Exclude"

end
