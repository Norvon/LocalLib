//
//  CSYBaseTableViewFactory.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYBaseTableViewFactory : NSObject

/**
 *  创建默认表格
 *
 *  @param rect       表格区域
 *  @param delegate   回调接口
 *  @param dataSource 数据源
 *  @param style      样式
 *
 *  @return 表格实例
 */
+ (UITableView * ) createDefaultTableViewWithFrame:(CGRect) rect
                                          delegate:(id<UITableViewDelegate>)delegate
                                        dataSource:(id<UITableViewDataSource>)dataSource
                                             style:(UITableViewStyle)style;
@end

NS_ASSUME_NONNULL_END
