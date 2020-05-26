//
//  BaseViewController.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/6.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "BaseViewController.h"

#import "UIImage+CSYUtil.h"
#import "ColorMacros.h"
#import "UtilMacros.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 初始化页面
    self.view.backgroundColor = kCSYColorF5F5F5;
    self.automaticallyAdjustsScrollViewInsets = NO;

    // 存储api
    self.apiArr = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self initNav];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark - 导航相关
/// 导航
- (void)initNav {

    [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:kCSYColorD6D7DC]];  //导航栏分割线
}

/// 返回按钮
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target
                                          action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_black"]
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

- (void)addNavItemWithTitles:(NSArray *)titles isLeftItem:(BOOL)isLeftItem target:(id)target action:(SEL)action {

    NSMutableArray * items = [[NSMutableArray alloc] init];

    NSMutableArray * buttonArray = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString * title in titles) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = CreateSystemFontWithSize(12);
        [btn setTitleColor:kCSYColorEA5504 forState:UIControlStateNormal];
        btn.tag = i++;
        [btn sizeToFit];

        // 偏移
        if (isLeftItem) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
        } else {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }

        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
        [buttonArray addObject:btn];
    }

    if (isLeftItem) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void)addNavItemWithImageNames:(NSArray *)imageNames isLeftItem:(BOOL)isLeftItem target:(id)target action:(SEL)action{

    NSMutableArray * items = [[NSMutableArray alloc] init];

    NSInteger i = 0;
    for (NSString * imageName in imageNames) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

        // 偏移
        if (isLeftItem) {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
        } else {
            [btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
        }

        btn.tag = i++;
        UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];

    }

    if (isLeftItem) {
        self.navigationItem.leftBarButtonItems = items;
    } else {
        self.navigationItem.rightBarButtonItems = items;
    }
}

- (void)hiddenNav:(BOOL)hidden {
    self.navigationController.navigationBar.hidden = hidden;
}

#pragma mark - tabbar
///  隐藏tabbar
- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

#pragma mark - statusBar
// 状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - 控制器相关
- (BOOL)isPresentVC {
    if (!self.navigationController) {
        return YES;
    }

    NSArray *viewcontrollers = self.navigationController.viewControllers;
    if (viewcontrollers.count >= 1) {
        // viewcontrollers[0] != self 防止是presen 导航 然后设置的根控制器
        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self && viewcontrollers[0] != self ) {
            return NO;
        }
    }
    return YES;
}

- (void)dealloc {
    DLog(@"%@ 界面内存已释放",[self class]);
}

@end
