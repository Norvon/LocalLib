//
//  CSYBaseTextInputView.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/8.
//

#import "CSYBaseTextInputView.h"
#import <Masonry/Masonry.h>
#import "ColorMacros.h"
#import "UtilMacros.h"

typedef enum : NSUInteger {
    kBaseTextInputViewViewType_IntroBtn = 100,
} BaseTextInputViewViewType;


@interface CSYBaseTextInputView ()<UITextFieldDelegate>

@end

@implementation CSYBaseTextInputView

#pragma mark - 获取和设置输入内容
- (void)setContentStr:(NSString *)contentStr {
    self.inputText.text = contentStr;
}

- (NSString *)contentStr {
    return self.inputText.text;
}

#pragma mark - 设置默认 placeholderStr
- (void)setPlaceholderStr:(NSString *)placeholderStr {
    _placeholderStr = placeholderStr;
    
    UIFont *font = self.placeholderFont ? : CreateSystemFontWithSize(12);
    UIColor *color = self.placeholderColor ? : kCSYColor9399A5;
    
    NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:placeholderStr];
    [aAttributedString addAttribute:NSForegroundColorAttributeName
                              value:color
                              range:NSMakeRange(0, placeholderStr.length)];
    [aAttributedString addAttribute:NSFontAttributeName
                              value:font
                              range:NSMakeRange(0, placeholderStr.length)];
    self.inputText.attributedPlaceholder = aAttributedString;
}

#pragma mark - 是否启用密码
- (void)setEnablePwdMode:(BOOL)enablePwdMode {
    _enablePwdMode = enablePwdMode;
    self.inputText.secureTextEntry = _enablePwdMode;
}

#pragma mark - 右侧View
/// 设置验证码
- (void)addRightView:(UIView *)view withSize:(CGSize )viewSize {
    [self removeAddRightView];
    
    view.tag = kBaseTextInputViewViewType_IntroBtn;
    [self addSubview:view];
    [view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.inputText.mas_centerY);
        make.right.equalTo(self.inputText.mas_right).offset(-5);
        make.size.mas_equalTo(viewSize);
    }];
}

/// 删除验证码
- (void)removeAddRightView {
    for (UIView * view in self.subviews) {
        if (view.tag == kBaseTextInputViewViewType_IntroBtn) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - title相关
- (void)setTitle:(NSString *)title {
    _title = title;
    
    UILabel *titleLabel = self.titleLabel;
    titleLabel.text = title;
    [titleLabel sizeToFit];
    
    CGRect frame     = titleLabel.frame;
    frame.origin.x   = 14;
    titleLabel.frame = frame;
    
    [self curreentSetInputeLeftVileWithView:titleLabel];
}

- (void)setAttributedTitle:(NSMutableAttributedString *)attributedTitle {
    
    _attributedTitle = attributedTitle;
    
    UILabel *titleLabel = self.titleLabel;
    
    titleLabel.attributedText  = attributedTitle;
    [titleLabel sizeToFit];
    CGRect frame     = titleLabel.frame;
    frame.origin.x   = 14;
    titleLabel.frame = frame;
    
    [self curreentSetInputeLeftVileWithView:titleLabel];
}

- (void)curreentSetInputeLeftVileWithView:(UIView *)view {
    UIView *left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width + 24, view.frame.size.height)];
    [left addSubview:view];
    _inputText.leftView     = left;
    _inputText.leftViewMode = UITextFieldViewModeAlways;
}

- (void)updateTitleWidth:(CGFloat)width {
    CGRect frame = self.inputText.leftView.frame;
    self.inputText.leftView.frame = CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height);
}

#pragma mark - textField 代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputTextShouldBeginEditing:)]) {
        return [self.delegate inputTextShouldBeginEditing:self];
    }
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputTextDidBeginEditing:)]) {
        [self.delegate inputTextDidBeginEditing:self];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (string.length == 0) { // 删除按钮
        return YES;
    }
    
    if ([string isEqualToString:@"\n"]) {//检测到“完成”
        [textField resignFirstResponder];//释放键盘
        return NO;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputTextView:textField:shouldChangeTextInRange:replacementText:)]) {
        return [self.delegate inputTextView:self textField:textField shouldChangeTextInRange:range replacementText:string];
    }
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(inputTextDidChange:)]) {
        [self.delegate inputTextDidChange:self];
    }
}

#pragma mark - init
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    [self addSubview:self.inputText];
    
    [self setupUI];
}

- (void)setupUI {
    [_inputText mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - 实例
- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 0, CGFLOAT_MAX, self.frame.size.height)];
    _titleLabel.textAlignment   = NSTextAlignmentCenter;
    _titleLabel.numberOfLines   = 1;
    _titleLabel.font            = CreateSystemFontWithSize(12);
    _titleLabel.backgroundColor = kCSYColorClear;
    _titleLabel.textColor       = kCSYColor333333;
    
    return _titleLabel;
}

- (UITextField *)inputText {
    
    if (_inputText) {
        return _inputText;
    }
    
    _inputText = [[UITextField alloc] init];;
    _inputText.backgroundColor = kCSYColorWhite;
    _inputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inputText.keyboardType    = UIKeyboardTypeDefault;
    _inputText.font            = CreateSystemFontWithSize(12.f);
    _inputText.placeholder     = @"";
    _inputText.textColor       = kCSYColor333333;
    _inputText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _inputText.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, self.frame.size.height)];
    _inputText.leftViewMode             = UITextFieldViewModeAlways;
    _inputText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _inputText.delegate                 = self;
    [_inputText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    return _inputText;
}
@end
