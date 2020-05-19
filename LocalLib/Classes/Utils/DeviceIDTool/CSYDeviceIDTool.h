//
//  CSYDeviceIDTool.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYDeviceIDTool : NSObject
/// 自己拼接的UUID
+ (NSString *)deviceUUID;
@end

NS_ASSUME_NONNULL_END
