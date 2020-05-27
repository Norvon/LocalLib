//
//  CSYSearchHistoryTableHeader.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYSearchHistoryTableHeader : UIView
@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UIButton *cleanBtn;;

@property (nonatomic, copy) void(^callBackBlock) (void);
@end

NS_ASSUME_NONNULL_END
