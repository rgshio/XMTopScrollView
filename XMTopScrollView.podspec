Pod::Spec.new do |s|
s.name         = 'XMTopScrollView'
s.version      = '0.0.1'
s.license      = 'MIT'
s.summary      = 'top scroll category class.'
s.description  = %{XMTopScrollView is a top scroll category class.}
s.homepage     = 'https://github.com/rgshio/XMTopScrollView'
s.author       = { 'rgshio' => 'xzy0819@qq.com' }

s.source       = { :git => 'https://github.com/rgshio/XMTopScrollView.git', :tag => "v#{s.version}" }

s.source_files = 'Classes/XMTopScrollView/*'
s.ios.frameworks = 'Foundation', 'UIKit'
s.ios.deployment_target = '7.0' # minimum SDK with autolayout

s.requires_arc = true

end