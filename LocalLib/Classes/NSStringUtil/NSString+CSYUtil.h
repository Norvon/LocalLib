//
//  NSString+CSYUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CSYUtil)
/*
 获取随机数字
 */
+ (NSString *)randomNumStringWithLength:(NSInteger)len;

/**
 通过价格获取价格分割字符串
 */
+ (NSString *)getSeparatePriceStringWithPrice:(double)price;

/**

 获取价格和单位

 如果不符合规则返回空字符串 自己外层判断
 2.1.移动端金额统一显示为“￥+金额值”，如：￥3000、￥20万

 2.2.项目保证金/预算单位改为万元，其他金额（如订单金额）仍以元为单位，无论万元或元为单位，最小单位均为0.01，即精确到小数点后2位（数据库可按小数点后4位存储）。

 2.3.项目保证金/预算回显时，小数位去零显示，即如“￥8.00万、￥8.10万、￥8.11万”分别显示为“￥8万、￥8.1万、￥8.11万”

 2.4.项目保证金/预算显示逻辑：

 1）若无保证金显示为“暂无保证金”；若项目预算为空显示“面议”。

 2）若历史数据/新数据中存在小于0.01万元，同1）显示逻辑。

 3）若金额大于等于0.01万元，小于等于9000万元时，以万为单位，四舍五入精确到小数点后2位（同2.3规则），如：￥1200万、￥3.6万；

 4）若金额大于9000万元，以亿为单位，四舍五入精确小数点后2位，如：￥1.8亿、￥21亿。


 */
+ (NSString *)getUnitPriceStringWithPrice:(double)price;



/// 字段转字符串
+ (NSString*)dictionaryToJsonStr:(NSDictionary *)dic;


/// 去除两位小数末尾的0
- (NSString *)removeDecimalEndZero;


+ (NSString *)getNewUnitPriceStringWithPrice:(double)price;
/**
 字符串替换

 @param str 替换为str
 @param startLocation 开始字符串
 @param lenght 长度
 */
- (NSString *)replaceStringWithStr:(NSString *)str startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght;

- (NSString *)getBankNo;

- (NSString *)maxLength:(NSUInteger)length;

+ (NSString *)getNumberAddStrWithCount:(int)count maxCount:(int) maxCount;
@end
NS_ASSUME_NONNULL_END
