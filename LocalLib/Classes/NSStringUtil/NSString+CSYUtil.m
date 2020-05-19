//
//  NSString+CSYUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/11.
//

@implementation NSString (CSYUtil)
+ (NSString *)randomNumStringWithLength:(NSInteger)len {
    NSString *letters = @"0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];

    for (NSInteger i = 0; i < len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    return randomString;
}

+ (NSString *)getSeparatePriceStringWithPrice:(double)price {
    if (!price) {
        return @"0.00";
    }

    NSNumberFormatter *moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat = @",##0.00";
    NSNumber *priceNumber = [NSNumber numberWithDouble:price];

    NSString *priceStr = [moneyFormatter stringFromNumber:priceNumber];

    // 判断价格保留的两位小数是不是小于0
    NSArray *tempArr = [priceStr componentsSeparatedByString:@"."];
    NSString *pointStr = tempArr.lastObject;
    if ([pointStr intValue] <= 0) {
        return tempArr.firstObject;
    }

    return priceStr;
}

+ (NSString *)getNewUnitPriceStringWithPrice:(double)price {
    if (price <= 0) { // 价格异常
        return @"";
    }
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;    //设置最大小数点后的位数
    formatter.minimumFractionDigits = 0;    //设置最小小数点后的位数
    [formatter setPositiveFormat:@"##.##"];
    
    if (price < 10000) { // 小于1万元
        NSNumber *number = [NSNumber numberWithDouble:price];
        NSString *string = [formatter stringFromNumber:number];
        return string;
    }
    else if (price < 100000000) { // 大于等于 1万元 小于 1亿元
        
        double value = 10000.0;
        NSNumber *number = [NSNumber numberWithDouble:price / value];
        NSString *string = [formatter stringFromNumber:number];
        return [NSString stringWithFormat:@"%@万", string];
    }
    else { // 亿
        double value = 100000000.0;
        NSNumber *number = [NSNumber numberWithDouble:price / value];
        NSString *string = [formatter stringFromNumber:number];
        return [NSString stringWithFormat:@"%@亿", string];
    }
}


+ (NSString *)getUnitPriceStringWithPrice:(double)price {
    if (price < 0) { // 价格异常
        return @"";
    }

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;    //设置最大小数点后的位数
    formatter.minimumFractionDigits = 0;    //设置最小小数点后的位数
    [formatter setPositiveFormat:@"##.##"];
    
    if (price < 100) { // 小于0.01万元
        return @"";
    } else if (price <= 90000000) { // 大于等于 0.01万元 小于等于 9000万元
        double value = 10000.0;
        NSNumber *number = [NSNumber numberWithDouble:price / value];
        NSString *string = [formatter stringFromNumber:number];
        return [NSString stringWithFormat:@"%@万", string];
    } else { // 亿
        double value = 100000000.0;
        NSNumber *number = [NSNumber numberWithDouble:price / value];
        NSString *string = [formatter stringFromNumber:number];
        return [NSString stringWithFormat:@"%@亿", string];
    }
}

/// 去除两位小数末尾的0
- (NSString *)removeDecimalEndZero {
    NSString *priceStr = self;
    if (!priceStr.length || [priceStr compare:@"."] == NO) {
        return @"";
    }

    NSArray *arr = [priceStr componentsSeparatedByString:@"."];
    if (arr.count != 2) {
        return @"";
    }

    NSString *decimalStr = arr.lastObject;
    if ([decimalStr isEqualToString:@"00"]) {
        return arr.firstObject;
    }

    if ([decimalStr hasSuffix:@"0"]) {
        return [NSString stringWithFormat:@"%@.%@", arr.firstObject, [decimalStr substringToIndex:1]];
    }

    return priceStr;
}

- (NSString *)replaceStringWithStr:(NSString *)str startLocation:(NSInteger)startLocation lenght:(NSInteger)lenght {
    NSString *newStr = self;

    if (startLocation < 0) {
        return newStr;
    }

    if (!newStr.length) {
        return @"";
    }

    if (newStr.length - 1 < startLocation && startLocation >= 0) {
        return newStr;
    }

    if (newStr.length < startLocation + lenght && lenght >= 0) {
        return newStr;
    }

    for (int i = 0; i < lenght; i++) {

        NSRange range = NSMakeRange(startLocation, 1);

        newStr = [newStr stringByReplacingCharactersInRange:range withString:str];

        startLocation ++;
    }

    return newStr;
}

+ (NSString*)dictionaryToJsonStr:(NSDictionary *)dic {
    
    if (!dic) {
        return @"";
    }
    
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    if(parseError) {
        return @"";
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSString *)getBankNo {
    
    if (!self.length) {
        return @"";
    }
    
    NSMutableString *newString = [NSMutableString string];
    NSString *text = [self copy];
    
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        [newString appendString:subString];
        if (subString.length == 4) {
            [newString appendString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    return newString;
}

- (NSString *)maxLength:(NSUInteger)length {
    if (self.length <= length) {
        return self;
    }
    
    return [NSString stringWithFormat:@"%@...", [self substringToIndex:length]];
}

+ (NSString *)getNumberAddStrWithCount:(int)count maxCount:(int) maxCount {
    return (count > maxCount ?
            [NSString stringWithFormat:@"%@+", @(maxCount)] :
            [NSString stringWithFormat:@"%@" , @(count)]);;
}

@end
