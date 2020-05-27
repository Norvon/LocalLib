//
//  CSYSearchHeader.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYSearchHeader.h"
#import "UtilMacros.h"
#import "ColorMacros.h"
#import <Masonry/Masonry.h>

@interface CSYSearchHeader ()

@end

@implementation CSYSearchHeader

- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {

    self.layer.shadowColor = kCSYColorD1D1D1.CGColor;
    self.layer.shadowOffset = CGSizeMake(0,4);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 10;

    self.backgroundColor = kCSYColorWhite;

    [self addSubview: self.iconImageView];
    [self addSubview: self.searchTextField];
    [self addSubview: self.cancelBtn];

    [self setupUI];
}

- (void)setupUI {

    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-12);
        make.left.equalTo(self).offset(24);
        make.size.mas_equalTo(CGSizeMake(19, 20));
    }];

    [_cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(60);
        make.right.equalTo(self);
    }];


    [_searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImageView);
        make.left.equalTo(self.iconImageView.mas_right).offset(10);
        make.right.equalTo(self.cancelBtn.mas_left);
    }];
}

#pragma mark - 点击
- (void)clickBtn:(UIButton *)sender {
    if (self.callBackBlock) {
        self.callBackBlock();
    }
}

#pragma mark - 实例
- (UIImageView *)iconImageView {
    if (_iconImageView) {
        return _iconImageView;
    }

    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"search_icon"];

    return _iconImageView;
}

- (UITextField *)searchTextField {
    if (_searchTextField) {
        return _searchTextField;
    }

    _searchTextField = [[UITextField alloc] init];
    _searchTextField.backgroundColor = kCSYColorWhite;
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTextField.keyboardType    = UIKeyboardTypeDefault;
    _searchTextField.font            = CreateSystemFontWithSize(14.f);
    _searchTextField.placeholder     = @"搜索您想要的";
    _searchTextField.textColor       = kCSYColor15223B;
    _searchTextField.returnKeyType   = UIReturnKeySearch;

    return _searchTextField;
}

- (UIButton *)cancelBtn {
    if (_cancelBtn) {
        return _cancelBtn;
    }

    _cancelBtn = [[UIButton alloc] init];
    _cancelBtn.titleLabel.font = CreateSystemFontWithSize(14);
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelBtn setTitleColor:kCSYColorEA5504 forState:UIControlStateNormal];

    [_cancelBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

    return _cancelBtn;
}

@end
