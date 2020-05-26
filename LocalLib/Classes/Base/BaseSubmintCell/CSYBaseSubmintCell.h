//
//  CSYBaseSubmintCell.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/2.
//

#import <UIKit/UIKit.h>
#import "CSYBaseSubmitView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseSubmintCell : UITableViewCell
@property (nonatomic, strong) CSYBaseSubmitView *submitView;

@property (nonatomic, copy) void (^callbackBlock) (void);

- (void)initView;
- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
