//
//  CSYBaseTableViewFactory.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/31.
//

#import "CSYBaseTableViewFactory.h"
#import "ColorMacros.h"

@implementation CSYBaseTableViewFactory
+ (UITableView * ) createDefaultTableViewWithFrame:(CGRect) rect
                                          delegate:(id<UITableViewDelegate>)delegate
                                        dataSource:(id<UITableViewDataSource>)dataSource
                                             style:(UITableViewStyle)style {

    UITableView * tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.backgroundView = nil;
    tableView.backgroundColor = kCSYColorF5F5F5;
    tableView.delegate = delegate;
    tableView.dataSource = dataSource;
    tableView.layer.borderWidth = 0;
    tableView.layer.shadowOffset = CGSizeZero;
    tableView.layer.shadowOpacity = 0;
    tableView.separatorColor = kCSYColorClear;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;

    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    return tableView;
}
@end
