//
//  CSYBaseTextInputIconView.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/8.
//

#import "CSYBaseTextInputIconView.h"
#import <Masonry/Masonry.h>

@interface CSYBaseTextInputIconView ()
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation CSYBaseTextInputIconView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.imageView];
    }
    return self;
}

- (void) layoutConstriant {
    __weak typeof (self) weakSelf =self;
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(weakSelf);
    }];
}

- (void)setIconName:(NSString *)iconName {
    _iconName = iconName;
    UIImage *image = [UIImage imageNamed:_iconName];
    self.imageView.image = image;
    self.frame = CGRectMake(0, 0, 8 + self.imageView.image.size.width, 16);

    if (@available(iOS 13.0, *)) {
        self.imageView.frame = CGRectMake(0, 0, [image size].width, [image size].height);
    } else {
        [self layoutConstriant];
    }
}
#pragma mark - 实例
- (UIImageView *)imageView {
    if (_imageView) {
        return _imageView;
    }

    return _imageView = [[UIImageView alloc] init];
}
@end
