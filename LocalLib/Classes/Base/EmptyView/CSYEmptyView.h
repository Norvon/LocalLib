//
//  CSYEmptyView.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/21.
//

#import "LYEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYEmptyView : LYEmptyView
/// 没有数据view
+ (instancetype)noDataEmptyView;

/// 网络异常
+ (instancetype)noNetworkEmptyViewWithTarget:(id)target action:(LYActionTapBlock)btnClickBlock;
@end

NS_ASSUME_NONNULL_END
