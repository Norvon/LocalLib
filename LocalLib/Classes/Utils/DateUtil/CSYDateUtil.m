//
//  CSYDateUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/15.
//

#import "CSYDateUtil.h"

@implementation CSYDateUtil
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)format {
    
    if (date == nil) {
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    format = format ? : kDU_yyyy_MM_dd_hh_mm;
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]]; // 后台返回的是date 字符串进行转换的时候需要进行转换
    NSString *dateString = [dateFormatter stringFromDate:date];

    return dateString;
}

+ (NSString *)getOriginalDateStringWithDate:(NSDate *)date format:(NSString *)format {
    
    if (date == nil) {
        return nil;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    format = format ? : kDU_yyyy_MM_dd_hh_mm;
    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:date];

    return dateString;
}

+ (NSString *)getLocalTimeTimestamp {
    
    NSDate *dateNow = [CSYDateUtil getLocalDate];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[dateNow timeIntervalSince1970]];

    return timeSp;
}

+ (NSDate *)getLocalDate {
    
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSTimeInterval interval = [zone secondsFromGMTForDate:date];
    NSDate *current = [date dateByAddingTimeInterval:interval];
    
    return current;
}
@end
