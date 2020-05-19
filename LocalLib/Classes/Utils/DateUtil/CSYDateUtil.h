//
//  CSYDateUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSYDateUtil : NSObject
//G: 公元时代，例如AD公元
//yy: 年的后2位
//yyyy: 完整年
//MM: 月，显示为1-12
//MMM: 月，显示为英文月份简写,如 Jan
//MMMM: 月，显示为英文月份全称，如 Janualy
//dd: 日，2位数表示，如02
//d: 日，1-2位显示，如 2
//EEE: 简写星期几，如Sun
//EEEE: 全写星期几，如Sunday
//aa: 上下午，AM/PM
//H: 时，24小时制，0-23
//K：时，12小时制，0-11
//m: 分，1-2位
//mm: 分，2位
//s: 秒，1-2位
//ss: 秒，2位
//S: 毫秒
//Z: 时区

//d
//将日显示为不带前导零的数字（如 1）。如果这是用户定义的数字格式中的唯一字符，请使用 %d。
//
//dd
//将日显示为带前导零的数字（如 01）。
//
//EEE
//将日显示为缩写形式（例如 Sun）。
//
//EEEE
//将日显示为全名（例如 Sunday）。
//
//M
//将月份显示为不带前导零的数字（如一月表示为 1）。如果这是用户定义的数字格式中的唯一字符，请使用 %M。
//
//MM
//将月份显示为带前导零的数字（例如 01/12/01）。
//
//MMM
//将月份显示为缩写形式（例如 Jan）。
//
//MMMM
//将月份显示为完整月份名（例如 January）。
//
//gg
//显示时代/纪元字符串（例如 A.D.）
//
//h
//使用 12 小时制将小时显示为不带前导零的数字（例如 1:15:15 PM）。如果这是用户定义的数字格式中的唯一字符，请使用 %h。
//
//hh
//使用 12 小时制将小时显示为带前导零的数字（例如 01:15:15 PM）。
//
//H
//使用 24 小时制将小时显示为不带前导零的数字（例如 1:15:15）。如果这是用户定义的数字格式中的唯一字符，请使用 %H。
//
//HH
//使用 24 小时制将小时显示为带前导零的数字（例如 01:15:15）。
//
//m
//将分钟显示为不带前导零的数字（例如 12:1:15）。如果这是用户定义的数字格式中的唯一字符，请使用 %m。
//
//mm
//将分钟显示为带前导零的数字（例如 12:01:15）。
//
//s
//将秒显示为不带前导零的数字（例如 12:15:5）。如果这是用户定义的数字格式中的唯一字符，请使用 %s。
//
//ss
//将秒显示为带前导零的数字（例如 12:15:05）。
//
//f
//显示秒的小数部分。例如，ff将精确显示到百分之一秒，而 ffff 将精确显示到万分之一秒。用户定义格式中最多可使用七个 f符号。如果这是用户定义的数字格式中的唯一字符，请使用 %f。
//
//t
//使用 12 小时制，并对中午之前的任一小时显示大写的 A，对中午到 11:59 P.M之间的任一小时显示大写的 P。如果这是用户定义的数字格式中的唯一字符，请使用 %t。
//
//tt
//对于使用 12 小时制的区域设置，对中午之前任一小时显示大写的 AM，对中午到 11:59 P.M之间的任一小时显示大写的 PM。
//
//对于使用 24 小时制的区域设置，不显示任何字符。
//
//y
//将年份 (0-9)显示为不带前导零的数字。如果这是用户定义的数字格式中的唯一字符，请使用 %y。
//
//yy
//以带前导零的两位数字格式显示年份（如果适用）。
//
//yyy
//以四位数字格式显示年份。
//
//yyyy
//以四位数字格式显示年份。
//
//z
//显示不带前导零的时区偏移量（如 -8）。如果这是用户定义的数字格式中的唯一字符，请使用 %z。
//
//zz
//显示带前导零的时区偏移量（例如 -08）
//
//zzz
//显示完整的时区偏移量（例如 -08:00）

#define kDU_yyyy_MM_dd_hh_mm            @"yyyy-MM-dd hh:mm"
#define kDU_HH_mm_ss                    @"HH:mm:ss"
#define kDU_HH_mm                       @"HH:mm"
#define kDU_yyyy_MM_dd_HH_mm_ss_SSSS    @"yyyy-MM-dd-HH:mm:ss:SSSS"
#define kDU_yyyy_MM_dd_HH_mm_ssss       @"yyyy-MM-dd-HH:mm:ssss"
#define kDU_yyyy                        @"yyyy"
#define kDU_yyyyMM                      @"yyyyMM"
#define kDU_yyyyMMdd                    @"yyyyMMdd"
#define kDU_yyyyMMddhhmmss              @"yyyyMMddhhmmss"
#define kDU_yyyyMMddHHmmssSSS           @"yyyyMMddHHmmssSSS"
#define kDU_yyyy_MM_dd_hh_mm_ss         @"yyyy-MM-dd HH:mm:ss"
#define kDU_yyyy_MM                     @"yyyy-MM"
#define kDU_yyyy_MM_dd                  @"yyyy-MM-dd"
#define kDU_MM_dd_HH_mm                 @"MM-dd HH:mm"
#define kDU_MMdd                        @"MMdd"
#define kDU_MM_dd                       @"MM-dd"
#define kDU_yyyyNIANMMYUE               @"yyyy年MM月"
#define kDU_MMYUEddRI                   @"MM月dd日"
#define kDU_MYUEdRI                     @"M月d日"
#define kDU_EEEd_MMM_yyyy_HH_mm_ss_zzz  @"EEE,d MMM yyyy HH:mm:ss zzz"
#define kDU_d_MMM_yyyy_HH_mm_ss_zzz     @"d MMM yyyy HH:mm:ss zzz"
#define kDU_MM_dd_yyyy_HH_mm_ss_tt      @"M/dd/yyyy HH:mm:ss aa"
#define kDU_yyyyNIANMMYUEddRI           @"yyyy年MM月dd日"
#define kDU_yyyy_MM_dd_T_hh_mm_ss_zzz   @"yyyy-MM-dd'T'HH:mm:ss+8:00"
#define kDU_yyyy_MM_dd_Thh_mm_ss_zzzz   @"yyyy-MM-dd'T'HH:mm:ss+08:00"
#define kDU_yyyy_MM_ddHHmmm             @"yyyy年MM月dd日 aa hh:mm"
#define kDU_yyyy_MM_ddHHmm              @"yyyy年MM月dd日 hh:mm"
#define kDU_yyyy_MM_ddHHmmmss           @"yyyy年MM月dd日 hh:mm:ss"


/**
 *  获取UTC+8:00时间格式
 *
 *  @param date    系统时间
 *  @param aFormat UTC+8时间
 *
 *  @return 时间字符串
 */
+ (NSString *)getDateStringWithDate:(NSDate *)date format:(NSString *)aFormat;

/*
 *  获取UTC+0:00时间格式
 *
 *  @param date    系统时间
 *  @param aFormat UTC+0时间
 *
 *  @return 时间字符串
 */
+ (NSString *)getOriginalDateStringWithDate:(NSDate *)date format:(NSString *)format;
/*
 获取当前系统时间 字符串
 */
+ (NSString *)getLocalTimeTimestamp;

/*
 获取当前系统时间 systemTimeZone
 */
+ (NSDate *)getLocalDate;
@end

NS_ASSUME_NONNULL_END
