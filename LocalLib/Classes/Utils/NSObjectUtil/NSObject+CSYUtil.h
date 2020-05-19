//
//  NSObject+CSYUtil.h
//  OrangeCDSCounselor
//
//  Created by nor on 2020/3/12.
//  Copyright © 2020 Norvon. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CSYUtil)
+ (BOOL)getVariableWithClass:(Class)myClass varName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
