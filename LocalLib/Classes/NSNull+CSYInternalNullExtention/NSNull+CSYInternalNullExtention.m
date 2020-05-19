//
//  NSNull+CSYInternalNullExtention.m
//  OrangeCDSCounselor
//
//  Created by nor on 2020/4/10.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "NSNull+CSYInternalNullExtention.h"
#import <objc/runtime.h>

#define NSNullObjects @[@"",@0,@{},@[]]

@implementation NSNull (CSYInternalNullExtention)

+ (void)load {
    @autoreleasepool {
        
        [self csyswizzleInstanceMethodWithClass:[NSNull class]
                                    originalSel:@selector(methodSignatureForSelector:)
                                 replacementSel:@selector(csymethodSignatureForSelector:)];
        
        [self csyswizzleInstanceMethodWithClass:[NSNull class]
                                    originalSel:@selector(forwardInvocation:)
                                 replacementSel:@selector(csyforwardInvocation:)];
    }
}

- (NSMethodSignature *)csymethodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
        for (NSObject *object in NSNullObjects) {
            signature = [object methodSignatureForSelector:aSelector];
            if (!signature) {
                continue;
            }
            if (strcmp(signature.methodReturnType, "@") == 0) {
                signature = [[NSNull null] methodSignatureForSelector:@selector(csynil)];
            }
            return signature;
        }
        return [self csymethodSignatureForSelector:aSelector];
    }
    return signature;
}

- (void)csyforwardInvocation:(NSInvocation *)anInvocation {
    if (strcmp(anInvocation.methodSignature.methodReturnType, "@") == 0) {
        anInvocation.selector = @selector(csynil);
        [anInvocation invokeWithTarget:self];
        return;
    }
    
    for (NSObject *object in NSNullObjects) {
        if ([object respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:object];
            return;
        }
    }
    
    [self csyforwardInvocation:anInvocation];
}

- (id)csynil {
    return nil;
}

+ (void)csyswizzleInstanceMethodWithClass:(Class)clazz originalSel:(SEL)original replacementSel:(SEL)replacement {
    Method originMethod = class_getInstanceMethod(clazz, original);
    Method replaceMethod = class_getInstanceMethod(clazz, replacement);
    if (class_addMethod(clazz, original, method_getImplementation(replaceMethod), method_getTypeEncoding(replaceMethod))) {
        class_replaceMethod(clazz, replacement, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }
    else {
        method_exchangeImplementations(originMethod, replaceMethod);
    }
}

@end
