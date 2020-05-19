//
//  CSYSystemUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYSystemUtil : NSObject
/// 相机是否可用
+ (BOOL) isCameraAvailable;

/// 相册是否可用
+ (BOOL) isAlbumAvailable;

/// 拷贝内容到剪贴板
+ (BOOL)copyToClipboardWithConten:(NSString *)content;
@end

NS_ASSUME_NONNULL_END
