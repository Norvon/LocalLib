//
//  CSYFileUtil.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/6.
//

#import "CSYFileUtil.h"

@implementation CSYFileUtil
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static CSYFileUtil *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedInstance];
}

- (NSString *)getDevicePath:(FileUtilPathType)type
{
    if (type == kFileUtilPathType_DocumentDirectory)
    {
        return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    }
    else if (type == kFileUtilPathType_LibraryDirectory)
    {
        return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    }
    else if (type == kFileUtilPathType_CachesDirectory)
    {
        return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    }

    return nil;
}

- (BOOL)createPath:(NSString *)path
{
    if (path == nil || path.length == 0)
    {
        return NO;
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path])
    {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:[NSDictionary dictionaryWithObject:NSFileProtectionNone forKey:NSFileProtectionKey] error:nil];
    }
    return YES;
}
- (BOOL)createFile:(NSString *)file
{
    if (file == nil || file.length == 0)
    {
        return NO;
    }

    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:file])
    {
        [fileManager createFileAtPath:file contents:nil attributes:[NSDictionary dictionaryWithObject:NSFileProtectionNone forKey:NSFileProtectionKey]];
    }
    return YES;
}

- (BOOL)removePath:(NSString *)path
{
    if (path == nil || path.length == 0)
    {
        return NO;
    }

    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}
- (BOOL)removeFile:(NSString *)file
{
    if (file == nil || file.length == 0)
    {
        return NO;
    }

    return [[NSFileManager defaultManager] removeItemAtPath:file error:nil];
}

- (BOOL)isFileExist:(NSString *)filePath
{
    if (filePath == nil || filePath.length == 0)
    {
        return NO;
    }
    return ([[NSFileManager defaultManager] fileExistsAtPath:filePath]);
}

- (long long)getFileSize:(NSString *)file
{
    if (file == nil || file.length == 0)
    {
        return 0;
    }
    return [[[[NSFileManager defaultManager] attributesOfItemAtPath:file error:nil] objectForKey:NSFileSize] intValue];
}
- (long long)getPathSize:(NSString *)path
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path])
    {
        return 0;
    }
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:path] objectEnumerator];
    NSString* fileName = @"";
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString* fileAbsolutePath = [path stringByAppendingPathComponent:fileName];
        folderSize += [self getFileSize:fileAbsolutePath];
    }
    return folderSize;
}

- (BOOL)copyFile:(NSString *)srcFilePath toPath:(NSString *)toFilePath
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:toFilePath])
    {
        [self createPath:[toFilePath stringByDeletingLastPathComponent]];
    }

    return [[NSFileManager defaultManager] copyItemAtPath:srcFilePath toPath:toFilePath error:nil] &&
    [[NSFileManager defaultManager] setAttributes:[NSDictionary dictionaryWithObject:NSFileProtectionNone forKey:NSFileProtectionKey] ofItemAtPath:toFilePath error:nil];
}

- (NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path {

    if (!path) {
        return @[];
    }

    NSError *error = nil;
    NSArray *arr = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        return @[];
    }

    return  arr.copy;
}

+ (CSYFileUtilFileType)getFileTypeWithFilePathStr:(NSString *)filePathStr {
    if (!filePathStr.length) {
        return CSYFileUtilFileType_unknown;
    }

    NSArray *arr = [filePathStr componentsSeparatedByString:@"."];
    if (arr.count <= 0) {
        return CSYFileUtilFileType_unknown;
    }
    NSString *suffixStr = arr.lastObject;
    suffixStr = suffixStr.lowercaseString;

    NSDictionary *dic = @{
                          // 图片
                          @"jpeg"   :  @(CSYFileUtilFileType_photo),
                          @"jpg"    : @(CSYFileUtilFileType_photo),
                          @"bmp"    : @(CSYFileUtilFileType_photo),
                          @"wbmp"   : @(CSYFileUtilFileType_photo),
                          @"png"    : @(CSYFileUtilFileType_photo),
                          @"tif"    : @(CSYFileUtilFileType_photo),
                          @"gif"    : @(CSYFileUtilFileType_photo),
                          @"pcx"    : @(CSYFileUtilFileType_photo),
                          @"tga"    : @(CSYFileUtilFileType_photo),
                          @"exif"   : @(CSYFileUtilFileType_photo),
                          @"fpx"    : @(CSYFileUtilFileType_photo),
                          @"svg"    : @(CSYFileUtilFileType_photo),
                          @"psd"    : @(CSYFileUtilFileType_photo),
                          @"cdr"    : @(CSYFileUtilFileType_photo),
                          @"pcd"    : @(CSYFileUtilFileType_photo),
                          @"dxf"    : @(CSYFileUtilFileType_photo),
                          @"ufo"    : @(CSYFileUtilFileType_photo),
                          @"eps"    : @(CSYFileUtilFileType_photo),
                          @"ai"     : @(CSYFileUtilFileType_photo),
                          @"raw"    : @(CSYFileUtilFileType_photo),
                          @"wmf"    : @(CSYFileUtilFileType_photo),
                          @"webp"   : @(CSYFileUtilFileType_photo),

                          // video
                          @"mpeg"   : @(CSYFileUtilFileType_video),
                          @"avi"    : @(CSYFileUtilFileType_video),
                          @"navi"   : @(CSYFileUtilFileType_video),
                          @"asf"    : @(CSYFileUtilFileType_video),
                          @"mov"    : @(CSYFileUtilFileType_video),
                          @"wmv"    : @(CSYFileUtilFileType_video),
                          @"3gp"    : @(CSYFileUtilFileType_video),
                          @"rm"     : @(CSYFileUtilFileType_video),
                          @"rmvb"   : @(CSYFileUtilFileType_video),
                          @"flv"    : @(CSYFileUtilFileType_video),
                          @"f4v"    : @(CSYFileUtilFileType_video),
                          @"mp4"    : @(CSYFileUtilFileType_video),

                          // 音频
                          @"cd"        : @(CSYFileUtilFileType_audio),
                          @"wave"      : @(CSYFileUtilFileType_audio),
                          @"aiff"      : @(CSYFileUtilFileType_audio),
                          @"mpeg"      : @(CSYFileUtilFileType_audio),
                          @"mp3"       : @(CSYFileUtilFileType_audio),
                          @"mpeg-4"    : @(CSYFileUtilFileType_audio),
                          @"midi"      : @(CSYFileUtilFileType_audio),
                          @"wma"       : @(CSYFileUtilFileType_audio),
                          @"realaudio" : @(CSYFileUtilFileType_audio),
                          @"vqf"       : @(CSYFileUtilFileType_audio),
                          @"oggvorbis" : @(CSYFileUtilFileType_audio),
                          @"amr"       : @(CSYFileUtilFileType_audio),
                          @"ape"       : @(CSYFileUtilFileType_audio),
                          @"flac"      : @(CSYFileUtilFileType_audio),
                          @"aac"       : @(CSYFileUtilFileType_audio),
                          @"wav"       : @(CSYFileUtilFileType_audio),

                          // pdf
                          @"pdf"    : @(CSYFileUtilFileType_pdf),

                          // ppt
                          @"ppt"    : @(CSYFileUtilFileType_ppt),
                          @"pptx"   : @(CSYFileUtilFileType_ppt),

                          // doc
                          @"doc"    : @(CSYFileUtilFileType_doc),
                          @"docx"   : @(CSYFileUtilFileType_doc),

                          // excel
                          @"xls"    : @(CSYFileUtilFileType_xls),
                          @"xlsx"   : @(CSYFileUtilFileType_xls),

                          // 压缩
                          @"zip"    : @(CSYFileUtilFileType_zip),
                          @"rar"    : @(CSYFileUtilFileType_zip),
                          @"7z"     : @(CSYFileUtilFileType_zip),

                          // txt
                          @"txt"    : @(CSYFileUtilFileType_txt),

                          };

    if ([dic objectForKey:suffixStr]) {
        return [[dic objectForKey:suffixStr] integerValue];
    }

    return CSYFileUtilFileType_unknown;
}

+ (NSString *)getFileImageNameWithFileUtilFileType:(CSYFileUtilFileType )type {

    if (!type) {
        return @"FileType_unknown";
    }


    NSDictionary *dic = @{
        @(CSYFileUtilFileType_photo)      : @"FileType_photo", // 图片
        @(CSYFileUtilFileType_video)      : @"FileType_video", // 视频
        @(CSYFileUtilFileType_audio)      : @"FileType_video", // 音频
        @(CSYFileUtilFileType_pdf)        : @"FileType_pdf", // pdf
        @(CSYFileUtilFileType_ppt)        : @"FileType_ppt", // ppt
        @(CSYFileUtilFileType_doc)        : @"FileType_doc", // doc
        @(CSYFileUtilFileType_xls)        : @"FileType_xls", // excel
        @(CSYFileUtilFileType_txt)        : @"FileType_txt", // excel
        @(CSYFileUtilFileType_zip)        : @"FileType_zip", // 压缩
        @(CSYFileUtilFileType_unknown)    : @"FileType_unknown", // 未知
    };

    if ([dic objectForKey:@(type)]) {
        return [dic objectForKey:@(type)];
    }

    return @"FileType_unknown";
}

+ (NSString *)getFileNameWithFileName:(NSString *)fileName cout:(int)count {
    if (!fileName.length || count <= 0) {
        return nil;
    }
    
    if (fileName.length <= count) {
        return fileName;
    } else {
        NSArray *arr = [fileName componentsSeparatedByString:@"."];
        if (arr.count == 0) {
            return fileName;
        } else if (arr.count == 1) { // 没有后缀
            
           return [fileName substringToIndex:count];
        } else {
            
            NSString *suffixStr = arr.lastObject;
            long tempCount = count - suffixStr.length - 1;
            NSString *tempName = [fileName substringToIndex:tempCount];
            return [NSString stringWithFormat:@"%@.%@", tempName, suffixStr];
        }
    }
}
@end
