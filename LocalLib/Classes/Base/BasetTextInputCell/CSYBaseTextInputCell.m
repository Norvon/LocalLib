//
//  CSYBasetTextInputCell.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/10.
//

#import "CSYBaseTextInputCell.h"
#import <Masonry/Masonry.h>
#import "ColorMacros.h"

@interface CSYBaseTextInputCell ()

@end

@implementation CSYBaseTextInputCell


- (void) layoutConstriant
{
    __weak typeof (self) weakSelf = self;
    [_textInputView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).insets(UIEdgeInsetsMake(1, 10, 1, 10));
    }];

    [_bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(weakSelf);
        make.height.equalTo(@(0.5));
    }];
}

- (void)setTextInputView:(CSYBaseTextInputView *)textInputView
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.backgroundColor = kCSYColorClear;

    if ([self.subviews containsObject:_textInputView]) {
        [_textInputView removeFromSuperview];
        _textInputView = nil;
    }



    _textInputView = textInputView;
    _textInputView.inputText.backgroundColor = kCSYColorClear;

    if ([self.subviews containsObject:_textInputView] == NO) {
        [self addSubview:_textInputView];
    }

    if ([self.subviews containsObject:self.bottomLineView] == NO) {
        [self addSubview:self.bottomLineView];
    }

    [self layoutConstriant];
}

- (UIView *)bottomLineView
{
    if (_bottomLineView) {
        return _bottomLineView;
    }

    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = kCSYColorWhiteAlpha40;

    return _bottomLineView;
}

@end
