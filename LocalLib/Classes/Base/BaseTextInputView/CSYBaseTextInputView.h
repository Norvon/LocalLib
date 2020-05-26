//
//  CSYBaseTextInputView.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CSYBaseTextInputView;
@protocol CSYBaseTextInputViewDelegate <NSObject>

@optional

- (BOOL)inputTextShouldBeginEditing:(CSYBaseTextInputView *)inputView;
- (void)inputTextDidBeginEditing:(CSYBaseTextInputView *)inputView;
- (void)inputTextDidChange:(CSYBaseTextInputView *)inputView;
- (BOOL)inputTextView:(CSYBaseTextInputView *) inputView textField:(UITextField *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
@end

@interface CSYBaseTextInputView : UIView
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UITextField *inputText;

/// 设置title
@property(nonatomic, copy) NSString *title;
/// 设置富文本title
@property(nonatomic, strong) NSMutableAttributedString *attributedTitle;

@property(nonatomic, strong) UIColor *placeholderColor;
@property(nonatomic, strong) UIFont *placeholderFont;
/// 提示文案
@property(nonatomic, copy) NSString *placeholderStr;
/// inputText 输入的内容
@property(nonatomic, copy) NSString *contentStr;
/// 是否启用密码输入模式
@property(nonatomic, assign) BOOL enablePwdMode;

/// 输入的正则判断， 用于记录
@property(nonatomic, copy) NSString *enterRegularStr;

/// 代理
@property(nonatomic, weak) id <CSYBaseTextInputViewDelegate> delegate;

/// 设置右侧view
- (void)addRightView:(UIView *)view withSize:(CGSize )viewSize;

/// 更新title 的宽度
- (void)updateTitleWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
