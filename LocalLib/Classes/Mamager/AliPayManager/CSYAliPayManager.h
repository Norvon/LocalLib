//
//  CSYAliPayManager.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CSYAliPayManager;

typedef void (^CompletionBlock)(NSDictionary * dict);

@protocol CSYAliPayManagerDelegate <NSObject>

- (void) CSYAliPayManagerResult:(CSYAliPayManager * ) aliPayManager info:(id)info;

@end

@interface CSYAliPayManager : NSObject

@property (nonatomic, weak) id<CSYAliPayManagerDelegate> delegate;

+ (instancetype)sharedInstance;


- (void) payOrder:(NSString *)orderStr
       fromScheme:(NSString *)schemeStr
         callback:(CompletionBlock)completionBlock;
@end

NS_ASSUME_NONNULL_END
