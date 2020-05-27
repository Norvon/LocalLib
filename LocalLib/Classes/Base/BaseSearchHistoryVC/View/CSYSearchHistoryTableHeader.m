//
//  CSYSearchHistoryTableHeader.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYSearchHistoryTableHeader.h"
#import <Masonry/Masonry.h>
#import "UtilMacros.h"
#import "ColorMacros.h"

@implementation CSYSearchHistoryTableHeader

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
    [self addSubview:self.tipLabel];
    [self addSubview:self.cleanBtn];


    [self setupUI];
}

- (void)setupUI {
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(24);
        make.centerY.equalTo(self);
    }];

    [_cleanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.centerY.equalTo(self.tipLabel);
    }];
}

#pragma mark - 点击
- (void)clickBtn:(UIButton *)sender {
    if (self.callBackBlock) {
        self.callBackBlock();
    }
}

#pragma mark - 实例
- (UILabel *)tipLabel {
    if (_tipLabel) {
        return _tipLabel;
    }

    _tipLabel = [[UILabel alloc] init];
    _tipLabel.text = @"搜索历史";
    _tipLabel.textColor = kCSYColor15223B;
    _tipLabel.font = CreateSystemFontWithSize(14);
    _tipLabel.numberOfLines = 1;
    _tipLabel.textAlignment = NSTextAlignmentLeft;

    return _tipLabel;
}

- (UIButton *)cleanBtn {
    if (_cleanBtn) {
        return _cleanBtn;
    }

    _cleanBtn = [[UIButton alloc] init];

    [_cleanBtn setImage:[UIImage imageNamed:@"close_icon"] forState:UIControlStateNormal];

    [_cleanBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

    return _cleanBtn;
}

@end
