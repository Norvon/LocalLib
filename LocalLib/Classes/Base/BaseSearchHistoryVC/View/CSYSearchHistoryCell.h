//
//  CSYSearchHistoryCell.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYSearchHistoryCell : CSYBaseCell

@property (nonatomic, strong) NSArray *btnTitleArray;

@property (nonatomic, copy) void(^callBackBlock) (NSUInteger idx);

- (CGFloat)cellHeight;
@end

NS_ASSUME_NONNULL_END
