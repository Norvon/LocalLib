//
//  DataDigest.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/9/2.
//

#import "DataDigest.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DataDigest
+ (NSData *) sha1Digest:(NSData *) data
{
    if (data == nil || data.length == 0)
    {
        return nil;
    }
    uint8_t * buffer = (uint8_t *) malloc(sizeof(uint8_t) * (CC_SHA1_DIGEST_LENGTH + 1));
    memset(buffer, 0, sizeof(uint8_t) * (CC_SHA1_DIGEST_LENGTH + 1));
    CC_SHA1([data bytes], (CC_LONG)[data length], buffer);
    NSData * digestData= [[NSData alloc] initWithBytes:buffer length:CC_SHA1_DIGEST_LENGTH];
    free(buffer);
    return digestData;
}

+ (NSData *) md5Digest:(NSData *) data;
{
    if (data == nil || data.length == 0)
    {
        return nil;
    }

    NSData* digestData = nil;
    if([data length]>0)
    {
        uint8_t digest[CC_MD5_DIGEST_LENGTH];
        CC_MD5([data bytes], (CC_LONG)[data length], digest);
        digestData = [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
    }
    return digestData;
}


+ (NSString*) binToHexWithData:(NSData*)data
{
    if (data == nil || data.length == 0)
    {
        return nil;
    }
    //将二进制数据转换为十六进制字符串
    if(data&&[data length]>0)
    {
        NSMutableString* mStr=[[NSMutableString alloc] initWithCapacity:0];

        for(int i=0;i<[data length];i++)
        {
            NSData* subData=[data subdataWithRange:NSMakeRange(i, 1)];
            uint8_t* bytes=(uint8_t*)[subData bytes];
            NSString* tempStr=[NSString stringWithFormat:@"%02X",bytes[0]];
            [mStr appendString:tempStr];
        }
        return mStr;
    }
    return nil;
}
@end
