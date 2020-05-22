//
//  CSYEmptyView.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/21.
//

#import "CSYEmptyView.h"
#import "ColorMacros.h"
#import "UtilMacros.h"

@implementation CSYEmptyView

+ (instancetype)noDataEmptyView {
    return [CSYEmptyView emptyViewWithImageStr:@"no_data_empty"
                                      titleStr:@"暂无数据，去别处看看吧"
                                     detailStr:nil];
}

+ (instancetype)noNetworkEmptyViewWithTarget:(id)target action:(LYActionTapBlock)btnClickBlock {

    CSYEmptyView *diy = [CSYEmptyView emptyActionViewWithImageStr:@"error_data_empty"
                                                         titleStr:nil
                                                        detailStr:nil btnTitleStr:@"网络异常，请检查网络点击重试"
                                                    btnClickBlock:btnClickBlock];

    return diy;
}

- (void)prepare{
    [super prepare];
    self.titleLabFont = CreateSystemFontWithSize(14);
    self.titleLabTextColor = kCSYColor9399A5;


    self.actionBtnBackGroundColor = kCSYColorClear;
    self.actionBtnFont =  CreateSystemFontWithSize(14);
    self.actionBtnTitleColor = kCSYColor9399A5;
}
@end
