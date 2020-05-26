//
//  CSYBasetTextInputCell.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/10.
//

#import <UIKit/UIKit.h>
#import "CSYBaseTextInputView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseTextInputCell : UITableViewCell
@property (nonatomic, weak) CSYBaseTextInputView * textInputView;
@property (nonatomic, strong) UIView * bottomLineView;
- (void) layoutConstriant;
@end

NS_ASSUME_NONNULL_END
