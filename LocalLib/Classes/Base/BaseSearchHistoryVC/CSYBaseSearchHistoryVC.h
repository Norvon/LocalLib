//
//  CSYHomeSearchVC.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "BaseViewController.h"
#import "CSYBaseSearchResultVC.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseSearchHistoryVC : BaseViewController
@property (nonatomic, copy) NSString *saveKey;
@property (nonatomic, copy) NSString *searchPlaceholder;
@property (nonatomic, copy) NSString *noSearchTipStr;
@property (nonatomic, strong) CSYBaseSearchResultVC *resultVC;

/// 存储数据
- (void)saveHistoryArr:(NSArray *)historyArr;
/// 取出数据
- (NSArray *)localHistoryArr;
@end

NS_ASSUME_NONNULL_END
