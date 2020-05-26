//
//  CSYBaseCell.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/7.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYBaseCell.h"

@implementation CSYBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
