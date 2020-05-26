//
//  CSYBaseSubmitFooter.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/11.
//

#import "CSYBaseSubmitFooter.h"
#import <Masonry/Masonry.h>
#import "ColorMacros.h"

@implementation CSYBaseSubmitFooter

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {

    [self addSubview:self.submitView];
    [self setupUI];
}

- (void)setupUI {
    CGFloat margin = 20;
    [_submitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(margin);
        make.right.equalTo(self).offset(-margin);
        make.height.mas_equalTo(50);
        make.centerY.equalTo(self);
    }];
}

#pragma mark - 实例
- (CSYBaseSubmitView *)submitView {
    if (_submitView) {
        return _submitView;
    }

    _submitView = [[CSYBaseSubmitView alloc] init];
    _submitView.disableColor = kCSYColorCBCBCB;
    _submitView.submitTitle = @"下一步";

    __weak typeof(self)weakSelf = self;
    _submitView.submitBlock = ^{
        if (weakSelf.callbackBlock) {
            weakSelf.callbackBlock();
        }
    };

    return _submitView;
}

@end
