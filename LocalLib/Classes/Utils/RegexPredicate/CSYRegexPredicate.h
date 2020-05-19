//
//  CSYRegexPredicate.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/8.
//

#import <Foundation/Foundation.h>

#import "CSYRegexString.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYRegexPredicate : NSObject

/**
 正则校验

 @param string string
 @param regex regex
 @return 是否成功
 */
+ (BOOL) predicateWithString:(NSString *) string regex:(NSString *) regex;
@end

NS_ASSUME_NONNULL_END
