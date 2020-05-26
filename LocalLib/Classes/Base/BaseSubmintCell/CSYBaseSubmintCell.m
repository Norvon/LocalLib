//
//  CSYBaseSubmintCell.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/2.
//

#import "CSYBaseSubmintCell.h"
#import "ColorMacros.h"
#import <Masonry/Masonry.h>

@implementation CSYBaseSubmintCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {

    self.backgroundColor = kCSYColorClear;
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    [self.contentView addSubview:self.submitView];

    [self setupUI];
}

- (void)setupUI {
    [_submitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(17, 63, 0, 63));
    }];
}

#pragma mark - 实例
- (CSYBaseSubmitView *)submitView {
    if (_submitView) {
        return _submitView;
    }

    _submitView = [[CSYBaseSubmitView alloc] init];
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
