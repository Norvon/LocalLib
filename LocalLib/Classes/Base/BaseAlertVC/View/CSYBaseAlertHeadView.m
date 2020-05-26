//
//  CSYBaseAlertHeadView.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/12/9.
//

#import "CSYBaseAlertHeadView.h"
#import <Masonry/Masonry.h>
#import "UtilMacros.h"
#import "ColorMacros.h"

@implementation CSYBaseAlertHeadView

#pragma mark - 点击
- (void)clickBtn:(UIButton *)btn {
    if (self.clickCancelBlock) {
        self.clickCancelBlock();
    }
}

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.cancelBtn];
    
    [self setupUI];
}

- (void)setupUI {
    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.height.equalTo(self);
        make.width.equalTo(@(50));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(self);
    }];
}

#pragma mark - 实例
- (UIButton *)cancelBtn {
    if (_cancelBtn) {
        return _cancelBtn;
    }

    _cancelBtn = [[UIButton alloc] init];
    [_cancelBtn setImage:[UIImage imageNamed:@"close_black_icon"] forState:UIControlStateNormal];
    
    [_cancelBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    return _cancelBtn;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = CreateSystemFontWithSize(16);
    _titleLabel.textColor = kCSYColor15223B;

    return _titleLabel;
}


@end
