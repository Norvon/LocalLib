#
# Be sure to run `pod lib lint LocalLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocalLib'
  s.version          = '0.0.5'
  s.summary          = 'A short description of LocalLib.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
  TODO: Add long description of the pod here.
  DESC
  
  s.homepage         = 'https://github.com/norvon@126.com/LocalLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'norvon@126.com' => 'norvon@126.com' }
  s.source           = { :git => 'https://github.com/norvon@126.com/LocalLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '8.0'
  
  #  s.source_files = 'LocalLib/Classes/README.md'
  
  # s.resource_bundles = {
  #   'LocalLib' => ['LocalLib/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  
#  所有Util
  CSYDataDigest               = {:spec_path => "Utils", :spec_name => "DataDigest"               }
  CSYDateUtil                 = {:spec_path => "Utils", :spec_name => "DateUtil"                 }
  CSYDeviceIDTool             = {:spec_path => "Utils", :spec_name => "DeviceIDTool"             }
  CSYFileUtil                 = {:spec_path => "Utils", :spec_name => "FileUtil"                 }
  CSYFontUtil                 = {:spec_path => "Utils", :spec_name => "FontUtil"                 }
  CSYKeyGenerator             = {:spec_path => "Utils", :spec_name => "KeyGenerator",            :spec_dependency => ["LocalLib/DataDigest"] }
  CSYMachineModel             = {:spec_path => "Utils", :spec_name => "MachineModel"             }
  CSYInternalNullExtention    = {:spec_path => "Utils", :spec_name => "CSYInternalNullExtention" }
  CSYNSObjectUtil             = {:spec_path => "Utils", :spec_name => "NSObjectUtil"             }
  CSYNSStringUtil             = {:spec_path => "Utils", :spec_name => "NSStringUtil"             }
  CSYRegexPredicate           = {:spec_path => "Utils", :spec_name => "RegexPredicate"           }
  CSYSecurity                 = {:spec_path => "Utils", :spec_name => "Security"                 }
  CSYSystemUtil               = {:spec_path => "Utils", :spec_name => "SystemUtil",              :spec_dependency => ["LocalLib/LGAlertViewManager"]  }
  CSYUIButtonUtil             = {:spec_path => "Utils", :spec_name => "UIButtonUtil",            :spec_dependency => ["LocalLib/UIImageUtil"]  }
  CSYUIImageUtil              = {:spec_path => "Utils", :spec_name => "UIImageUtil"              }
  CSYUIView                   = {:spec_path => "Utils", :spec_name => "UIView"                   }
  CSYUIViewHud                = {:spec_path => "Utils", :spec_name => "UIViewHud",               :spec_dependency => ["MBProgressHUD"]}

  # 所有manager
  CSYLGAlertViewManager       = {:spec_path => "Mamager", :spec_name => "LGAlertViewManager",    :spec_dependency => ['LocalLib/LGAlertView'] }
  
  # 所有ThirdLib
  CSYLGAlertView              = {:spec_path => "ThirdLib", :spec_name => "LGAlertView"               }
  CSYLJContactManager         = {:spec_path => "ThirdLib", :spec_name => "LJContactManager"          }
  CSYLYEmptyView              = {:spec_path => "ThirdLib", :spec_name => "LYEmptyView"               }
  
  # 所有的宏
  CSYColorMacros              = {:spec_path => "Define", :spec_name => "ColorMacros"               }
  CSYUtilMacros               = {:spec_path => "Define", :spec_name => "UtilMacros"               }
  
  all_sub_spec = [
  #  所有Util
    CSYDataDigest,
    CSYDateUtil,
    CSYDeviceIDTool,
    CSYFileUtil,
    CSYFontUtil,
    CSYKeyGenerator,
    CSYMachineModel,
    CSYInternalNullExtention,
    CSYNSObjectUtil,
    CSYNSStringUtil,
    CSYRegexPredicate,
    CSYSecurity,
    CSYSystemUtil,
    CSYUIButtonUtil,
    CSYUIImageUtil,
    CSYUIView,
    CSYUIViewHud,
    
    # 所有manager
    CSYLGAlertViewManager,
    
    # 所有ThirdLib
    CSYLGAlertView,
    CSYLJContactManager,
    CSYLYEmptyView,
    
    # 所有的宏
    CSYColorMacros,
    CSYUtilMacros,
  ]
  
  all_sub_spec.each do |sub_spec|
    
    providerName       = sub_spec[:spec_name]
    providerPath       = sub_spec[:spec_path]
    providerDependency = sub_spec[:spec_dependency]
    
    s.subspec providerName do |ss|
      sources = ["LocalLib/Classes/#{providerPath}/#{providerName}/**/*"]
      ss.source_files = sources
      
      if providerDependency
        providerDependency.each do |dependency|
          ss.dependency dependency
        end
      end
      
    end
  end
  



end
