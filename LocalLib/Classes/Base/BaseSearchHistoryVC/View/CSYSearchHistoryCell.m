//
//  CSYSearchHistoryCell.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYSearchHistoryCell.h"
#import "UtilMacros.h"
#import "ColorMacros.h"
#import "UIView+LayoutMethods.h"

@interface CSYSearchHistoryCell ()
@property (nonatomic, strong) NSMutableArray *btnArr;

@property (nonatomic, strong) NSArray *tempTitleArray;
@end

@implementation CSYSearchHistoryCell

- (CGFloat)cellHeight {

    CGFloat defaultHeight = 20;

    if (self.btnArr.count) {
        UIButton *btn = self.btnArr.lastObject;

        return (CGRectGetMaxY(btn.frame) + 10) < defaultHeight ? defaultHeight : CGRectGetMaxY(btn.frame) + 10;
    }

    return defaultHeight;
}

#pragma mark - 点击
- (void)clickBtn:(UIButton *)btn {
    DLog(@"点击文案%@", btn.titleLabel.text);
    if (self.callBackBlock) {
        self.callBackBlock(btn.tag);
    }
}
#pragma mark - 赋值
- (void)setBtnTitleArray:(NSArray *)btnTitleArray {
    _btnTitleArray = btnTitleArray;

    if (self.tempTitleArray.count && [self.tempTitleArray isEqualToArray:btnTitleArray]) {
        return;
    } else {
        self.tempTitleArray = [btnTitleArray copy];
    }

    for (UIButton *btn in self.btnArr) {
        [btn removeFromSuperview];
    }

    self.btnArr = [NSMutableArray array];

    [btnTitleArray enumerateObjectsUsingBlock:^(NSString * title, NSUInteger i, BOOL * _Nonnull stop) {

        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = CreateSystemFontWithSize(12);
        [btn setTitleColor:kCSYColorEA5504 forState:UIControlStateNormal];
        [btn sizeToFit];

        btn.backgroundColor = kRGBColor16BitAlpha(0xEA5504, 10);

        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = kCSYColorEA5504.CGColor;

        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btn];

        [self.btnArr addObject:btn];
    }];

    [self layouBtn];
}

- (void)layouBtn {

    CGFloat leftMargin = 24;
    CGFloat rightMargin = 20;
    CGFloat spaceWidth = 10;
    CGFloat spaceHeight = 10;
    CGFloat addWidth = 20;
    CGFloat addHeight = 0;

    CGFloat contentWidth = kFullScreenWidth - leftMargin - rightMargin;

    for (int i = 0; i < self.btnArr.count; i++) {

        UIButton *btn = self.btnArr[i];

        CGFloat tempWidth = btn.width + addWidth;
        if (tempWidth >= contentWidth) {
            tempWidth = contentWidth;
        }

        CGFloat tempHeight = btn.height + addHeight;


        if (i == 0) {
            btn.frame = CGRectMake(leftMargin, spaceHeight, tempWidth, tempHeight);
        } else {
            UIButton *preBtn = self.btnArr[i - 1];

            if ((CGRectGetMaxX(preBtn.frame) + spaceWidth + tempWidth) > contentWidth + leftMargin) {
                // 换行
                 btn.frame = CGRectMake(leftMargin ,
                                        CGRectGetMaxY(preBtn.frame) + spaceHeight,
                                        tempWidth,
                                        tempHeight);
            } else {
                btn.frame = CGRectMake(CGRectGetMaxX(preBtn.frame) + spaceWidth ,
                                       preBtn.y,
                                       tempWidth,
                                       tempHeight);
            }
        }
    }
}

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

- (void)initView {

    self.backgroundColor = kCSYColorF5F5F5;

    [self setupUI];
}

- (void)setupUI {

}

#pragma mark - 实例

@end
