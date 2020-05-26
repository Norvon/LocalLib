//
//  CSYBaseRefreshHeader.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/26.
//

#import "CSYBaseRefreshHeader.h"
#import "UtilMacros.h"

@implementation CSYBaseRefreshHeader

- (void)prepare {
    [super prepare];

    self.lastUpdatedTimeLabel.hidden = YES;

    if (kHaveSafeArea) {
        self.mj_h += kStatusBarHeight;
    }

}

- (void)placeSubviews {
    [super placeSubviews];

    if (kHaveSafeArea) {
        self.mj_y += 20;
    }
}
@end
