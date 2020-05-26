//
//  CSYBaseAlertVC.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/9.
//

#import "CSYBaseAlertVC.h"
#import "UtilMacros.h"
#import "ColorMacros.h"

@interface CSYBaseAlertVC ()
@property (nonatomic, strong) UIButton *contentBtn;
@end

@implementation CSYBaseAlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}

#pragma mark - show and miss
- (void)showWithObj:(id)obj {
}

- (void)dismiss {
}

#pragma mark - 点击view
- (void)clickBackGroundView {
    
}

#pragma mark - init
- (void)initView {
    
    
    self.view.backgroundColor = kRGBColor16BitAlpha(0x000000, 20);
    
    [self.view addSubview:self.contentBtn];
    [self.view addSubview:self.currentContentView];
    
    [self.currentContentView addSubview:self.headView];
    
    [self setupUI];
}

- (void)setupUI {
    
}

#pragma mark - 实例

- (UIButton *)contentBtn {
    if (_contentBtn) {
        return _contentBtn;
    }
    
    _contentBtn = [[UIButton alloc] initWithFrame:self.view.bounds];
    [_contentBtn addTarget:self action:@selector(clickBackGroundView) forControlEvents:UIControlEventTouchUpInside];
    
    return _contentBtn;
}

- (UIView *)currentContentView {
    if (_currentContentView) {
        return _currentContentView;
    }
    
    _currentContentView = [[UIView alloc] init];
    _currentContentView.frame = CGRectMake(0, (kScreenHeight) * (2 / 5.0), kFullScreenWidth, (kScreenHeight) * (3 / 5.0));
    _currentContentView.backgroundColor = kCSYColorWhite;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_currentContentView.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                         cornerRadii:CGSizeMake(10, 10)];

    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = _currentContentView.bounds;
    maskLayer.path = maskPath.CGPath;
    _currentContentView.layer.mask = maskLayer;

    
    return _currentContentView;
}

- (CSYBaseAlertHeadView *)headView {
    if (_headView) {
        return _headView;
    }
    
    _headView = [[CSYBaseAlertHeadView alloc] init];
    _headView.frame = CGRectMake(0, 0, kFullScreenWidth, 50);
    _headView.backgroundColor = kCSYColorWhite;
    
    return _headView;
}

@end
