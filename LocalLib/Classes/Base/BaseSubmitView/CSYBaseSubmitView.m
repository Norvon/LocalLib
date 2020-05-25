//
//  CSYBaseSubmitView.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/10.
//

#import "CSYBaseSubmitView.h"
#import "ColorMacros.h"
#import "UtilMacros.h"
#import <Masonry/Masonry.h>

@interface CSYBaseSubmitView ()

@end

@implementation CSYBaseSubmitView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]){
        [self initView];
    }

    return self;
}

- (void)initView {

    self.backgroundColor = kCSYColorClear;

    [self addSubview:self.submitBtn];

    [self setupUI];
}

- (void)setupUI {

    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - setter
- (void)setEnableSubmitBtn:(BOOL)enableSubmitBtn {
    _enableSubmitBtn = enableSubmitBtn;

    self.submitBtn.enabled = enableSubmitBtn;
    if (enableSubmitBtn) {
        [_submitBtn setBackgroundColor:kCSYColorEA5504];
    } else {
        if (self.disableColor) {
            [_submitBtn setBackgroundColor:self.disableColor];
        } else {
            [_submitBtn setBackgroundColor:kRGBA(255, 255, 255, 0.5)];
        }

    }
}

- (void)setSubmitTitle:(NSString *)submitTitle {
    _submitTitle = submitTitle;

    [self.submitBtn setTitle:submitTitle forState:UIControlStateNormal];
}

- (void)setDisableColor:(UIColor *)disableColor {
    _disableColor = disableColor;
    [_submitBtn setBackgroundColor:self.disableColor];
}

#pragma mark -  点击
- (void)clickSubmitBtn:(UIButton *)sender {

    if (self.submitBlock) {
        self.submitBlock();
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(submit)]) {
        [self.delegate submit];
    }
}

#pragma mark - 实例
- (UIButton *)submitBtn {
    if (_submitBtn) {
        return _submitBtn;
    }

    _submitBtn = [[UIButton alloc] init];
    [_submitBtn setTitle:@"" forState:UIControlStateNormal];
    _submitBtn.titleLabel.font = CreateSystemFontWithSize(18);
    [_submitBtn setTitleColor:kCSYColorWhite forState:UIControlStateDisabled];
    if (self.disableColor) {
        [_submitBtn setBackgroundColor:self.disableColor];
    } else {
        [_submitBtn setBackgroundColor:kRGBA(255, 255, 255, 0.5)];
    }
    _submitBtn.enabled = NO;
    _submitBtn.layer.cornerRadius = 5;
    _submitBtn.layer.masksToBounds = YES;
    [_submitBtn addTarget:self action:@selector(clickSubmitBtn:) forControlEvents:UIControlEventTouchUpInside];

    return _submitBtn;
}
@end
