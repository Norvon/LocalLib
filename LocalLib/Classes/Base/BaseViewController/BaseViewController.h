//
//  BaseViewController.h
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/6.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import <UIKit/UIKit.h>

// vc
#import "CSYBaseNavViewController.h"

// other
#import "CSYBaseTableViewFactory.h"


// view
#import "CSYEmptyView.h"
#import "LYEmptyViewHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/// 保存网络请求
@property (nonatomic, strong) NSMutableArray *apiArr;

/**
 导航栏添加文本按钮
 */
- (void)addNavItemWithTitles:(NSArray *)titles isLeftItem:(BOOL)isLeftItem target:(id)target action:(SEL)action;

/**
 导航栏添加图标按钮
 */
- (void)addNavItemWithImageNames:(NSArray *)imageNames isLeftItem:(BOOL)isLeftItem target:(id)target action:(SEL)action;

/*
 是否是PresentVC
 */
- (BOOL)isPresentVC;
/*
 隐藏导航
 */
- (void)hiddenNav:(BOOL)hidden;
@end

NS_ASSUME_NONNULL_END
