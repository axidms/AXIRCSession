Pod::Spec.new do |s|
  s.name             = "AXIRCSession"
  s.version          = "0.1.0"
  s.summary          = "Internet Relay Chat Protocol"
  s.homepage         = "https://github.com/axidms/AXIRCSession"
  s.license          = 'MIT'
  s.author           = { "Alexander Mertvetsov" => "amertvetsov@yandex.ru" }
  s.source           = { :git => "https://github.com/axidms/AXIRCSession.git, :tag => s.version.to_s }
  
  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*.{h,m}'
end
