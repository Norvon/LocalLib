#
# Be sure to run `pod lib lint LocalLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LocalLib'
  s.version          = '0.0.6'
  s.summary          = '...'
  
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
  
  #  s.source_files = ''
  
   s.resource_bundles = {
     'LocalLib' => ['LocalLib/Assets/*']
   }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  
  # 所有的宏
  CSYColorMacros              = {:spec_path => "Define", :spec_name => "ColorMacros"               }
  CSYUtilMacros               = {:spec_path => "Define", :spec_name => "UtilMacros"               }
  
  # 所有Util
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
  CSYWechatPayManager         = {:spec_path => "Mamager", :spec_name => "WechatPayManager",      :spec_dependency => ['WechatOpenSDK'], :static_framework => true}
  CSYAliPayManager            = {:spec_path => "Mamager", :spec_name => "AliPayManager",         :spec_dependency => ['AlipaySDK-iOS']}
  CSYShareManager             = {:spec_path => "Mamager", :spec_name => "ShareManager",
    :spec_dependency => ['Toast', 'UMCCommon', 'UMCShare/UI', 'UMCShare/Social/ReducedWeChat', 'UMCShare/Social/ReducedQQ', 'UMCShare/Social/ReducedSina']}
  
  # 所有ThirdLib
  CSYLGAlertView              = {:spec_path => "ThirdLib", :spec_name => "LGAlertView"               }
  CSYLJContactManager         = {:spec_path => "ThirdLib", :spec_name => "LJContactManager"          }
  CSYLYEmptyView              = {:spec_path => "ThirdLib", :spec_name => "LYEmptyView"               }
  
  # base
  CSYEmptyView                        = {:spec_path => "Base", :spec_name => "EmptyView",                        :spec_dependency => ['LocalLib/LYEmptyView', 'LocalLib/ColorMacros', 'LocalLib/UtilMacros']   }
  CSYBaseNavViewController            = {:spec_path => "Base", :spec_name => "BaseNavViewController",            :spec_dependency => ['RTRootNavigationController']   }
  CSYBaseTableViewFactory             = {:spec_path => "Base", :spec_name => "BaseTableViewFactory",             :spec_dependency => ['LocalLib/ColorMacros']   }
  CSYBaseViewControlller              = {:spec_path => "Base", :spec_name => "BaseViewControlller",              :spec_dependency => ['LocalLib/BaseNavViewController', 'LocalLib/BaseTableViewFactory','LocalLib/EmptyView', 'LocalLib/UIImageUtil'] }
  CSYMainRootVC                       = {:spec_path => "Base", :spec_name => "MainRootVC",                       :spec_dependency => ['LocalLib/BaseNavViewController']   }
  CSYBaseSubmitView                   = {:spec_path => "Base", :spec_name => "BaseSubmitView",                   :spec_dependency => ['Masonry', 'LocalLib/ColorMacros', 'LocalLib/UtilMacros']   }
  CSYBaseSubmitFooter                 = {:spec_path => "Base", :spec_name => "BaseSubmitFooter",                 :spec_dependency => ['LocalLib/BaseSubmitView']   }
  CSYBaseSubmintCell                  = {:spec_path => "Base", :spec_name => "BaseSubmintCell",                  :spec_dependency => ['LocalLib/BaseSubmitView']   }
  CSYBaseRefreshFooter                = {:spec_path => "Base", :spec_name => "BaseRefreshFooter",                :spec_dependency => ['MJRefresh']}
  CSYBaseRefreshHeader                = {:spec_path => "Base", :spec_name => "BaseRefreshHeader",                :spec_dependency => ['MJRefresh', 'LocalLib/UtilMacros']} # ['MJRefresh', '~> 3.3.1'] 可以控制版本
  
  
  all_sub_spec = [
  # 所有的宏
    CSYColorMacros,
    CSYUtilMacros,
  
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
    CSYWechatPayManager,
    CSYAliPayManager,
    CSYShareManager,
    
    # 所有ThirdLib
    CSYLGAlertView,
    CSYLJContactManager,
    CSYLYEmptyView,
    
    # Base
    CSYEmptyView,
    CSYBaseNavViewController,
    CSYBaseTableViewFactory,
    CSYBaseViewControlller,
    CSYMainRootVC,
    CSYBaseSubmitView,
    CSYBaseSubmitFooter,
    CSYBaseSubmintCell,
    CSYBaseRefreshFooter,
    CSYBaseRefreshHeader,
    
    
  ]
  
#  循环进行添加
  all_sub_spec.each do |sub_spec|
    
    providerName            = sub_spec[:spec_name]
    providerPath            = sub_spec[:spec_path]
    providerDependency      = sub_spec[:spec_dependency]
    providerStaticFramework = sub_spec[:static_framework]
    
    s.subspec providerName do |ss|
      sources = ["LocalLib/Classes/#{providerPath}/#{providerName}/**/*"]
      ss.source_files = sources
      
      if providerDependency
        providerDependency.each do |dependency|
          ss.dependency *dependency
        end
      end
      
      if providerStaticFramework
        s.static_framework = providerStaticFramework
      end
      
    end
  end
  



end

# pod lib lint --use-libraries --subspec='WechatPayManager'
# --use-libraries  Lint使用静态库来安装 static_framework
# --subspec 只编译子模块
