//
//  CSYBaseSubmitView.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CSYBaseSubmitViewDelegate <NSObject>

- (void)submit;

@end

@interface CSYBaseSubmitView : UIView
@property (nonatomic, strong) UIColor *disableColor;
@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, copy) NSString *submitTitle;
@property (nonatomic, assign) BOOL enableSubmitBtn;
@property (nonatomic, copy) void (^submitBlock)(void);
@property (nonatomic, weak) id <CSYBaseSubmitViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
