//
//  CSYRegexPredicate.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/7/8.
//

#import "CSYRegexPredicate.h"

@implementation CSYRegexPredicate
+ (BOOL) predicateWithString:(NSString *) string regex:(NSString *) regex {
    if (string == nil || string.length == 0 || regex == nil || regex.length == 0) {
        return NO;
    }
    NSPredicate * passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [passWordPredicate evaluateWithObject:string];
}
@end
