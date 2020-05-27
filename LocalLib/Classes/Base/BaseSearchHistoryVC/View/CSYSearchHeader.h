//
//  CSYSearchHeader.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYSearchHeader : UIView
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, copy) void(^callBackBlock) (void);
@end

NS_ASSUME_NONNULL_END
