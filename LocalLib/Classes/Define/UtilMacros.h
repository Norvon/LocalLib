//
//  UtilMacros.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/5.
//

#ifndef UtilMacros_h
#define UtilMacros_h

/// 系统相关
#define kApplication        ([UIApplication sharedApplication])
#define kAppWindow          ([UIApplication sharedApplication].delegate.window)
#define kAppDelegate        ([AppDelegate shareAppDelegate].delegate)
#define kRootViewController ([UIApplication sharedApplication].delegate.window.rootViewController)
#define kUserDefaults       ([NSUserDefaults standardUserDefaults])
#define kNotificationCenter ([NSNotificationCenter defaultCenter])
#define kPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

/// 屏幕
#define kFullScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define kFullScreenHeight ([[UIScreen mainScreen] bounds].size.height)

#define kHaveSafeArea \
    ({  BOOL haveSafeArea = NO;\
        if (@available(iOS 11.0, *)) {\
        haveSafeArea = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
        }\
    (haveSafeArea);}) // iPhoneX

#define kHaveBottomSafeArea (kHaveSafeArea)
#define kBottomSafeAreaHeight (kHaveBottomSafeArea == YES ? 34 : 0)
#define kScreenHeight ([[UIScreen mainScreen] bounds].size.height - kBottomSafeAreaHeight)

/// 导航
#define kStatusBarHeight (kHaveBottomSafeArea == YES ? 44 : 20)
#define kNavBarHeight 44.0
#define kTabBarHeight (kHaveBottomSafeArea == YES ? 83 : 49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

/// 字体
#define CreateSystemFontWithSize(x) [UIFont systemFontOfSize:(x)]
#define CreateBoldSystemFontWithSize(x) [UIFont boldSystemFontOfSize:(x)]

/// 动画相关
#define kCSYAnimateDuration (0.375)


/// 网络提示相关
#define kRequestingTipMessage  (@"加载中，请稍候...")
#define kApiError @"服务器连接异常，请稍后重试"
#define kNetWorkError @"网络异常，请检查网络后重试"
#define kServiceError @"服务器连接异常，请稍后重试"


/// DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

/// 字符串默认值
#define TransString(x, y) ({                                                            \
NSString * z = @"";                                     \
if ([(x) isKindOfClass:[NSString class]] == NO)         \
{                                                       \
z = (y);                                            \
}                                                       \
else                                                    \
{                                                       \
z = (x);                                            \
}                                                       \
if(z.length == 0)                                       \
{                                                       \
z = (y);                                            \
}                                                       \
z;                                                      \
})

/// 数据格式校验
#define StrValid(f) (f != nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f != nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f != nil && [f isKindOfClass:[NSArray class]] && [f count] > 0)
#define ValidNum(f) (f != nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f != nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f != nil && [f isKindOfClass:[NSData class]])


// 计算高度
#define HeightForScreen(x)\
({\
float z = (x);\
if (kFullScreenWidth == 375)\
{\
    z *= 1;\
}\
else if (kFullScreenWidth > 375 && kFullScreenWidth <= 414) {\
    z *= 1.104;\
}\
else if (kFullScreenWidth <= 320)\
{\
    z *= 0.85;\
}\
else {\
    z *= 1;\
}\
z;\
})

#endif /* UtilMacros_h */


