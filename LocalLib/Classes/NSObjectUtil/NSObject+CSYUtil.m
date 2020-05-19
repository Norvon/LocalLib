//
//  NSObject+CSYUtil.m
//  OrangeCDSCounselor
//
//  Created by nor on 2020/3/12.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "NSObject+CSYUtil.h"
#import <objc/runtime.h>


@implementation NSObject (CSYUtil)
+ (BOOL)getVariableWithClass:(Class)myClass varName:(NSString *)name {
    unsigned int outCount, i;
    Ivar *ivars = class_copyIvarList(myClass, &outCount);
    for (i = 0; i < outCount; i++) {
        Ivar property = ivars[i];
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        if ([keyName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}
@end
