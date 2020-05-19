//
//  CSYFileUtil.h
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FileUtilPathType) {
    kFileUtilPathType_DocumentDirectory,    // document 目录
    kFileUtilPathType_LibraryDirectory,     // 临时目录
    kFileUtilPathType_CachesDirectory       // 缓存目录
};

typedef NS_ENUM(NSUInteger, CSYFileUtilFileType) {
    CSYFileUtilFileType_unknown, // 未知
    CSYFileUtilFileType_photo, // 图片
    CSYFileUtilFileType_pdf, // pdf
    CSYFileUtilFileType_doc, // doc
    CSYFileUtilFileType_video, // 视频
    CSYFileUtilFileType_xls, // excel
    CSYFileUtilFileType_zip, // 压缩
    CSYFileUtilFileType_ppt, // ppt
    CSYFileUtilFileType_audio, // 音频
    CSYFileUtilFileType_txt, // txt
};


@interface CSYFileUtil : NSObject
/**
 *  @brief 获得文件操作类实例
 *
 *  @return 返回文件操作类实例
 */
+ (instancetype)sharedInstance;

/**
 *  返回指定的系统目录
 *
 *  @param type 系统目录类型，参看FileUtilPathType定义
 *
 *  @return 返回相应系统路径，若指定类型不存在，则返回 nil
 */
- (NSString *)getDevicePath:(FileUtilPathType)type;

/**
 *  创建目录
 *
 *  @param path 目录地址，可带子目录
 *
 *  @return  YES 创建成功，NO 创建失败
 */
- (BOOL)createPath:(NSString *)path;

/**
 *  创建文件
 *
 *  @param file 文件全路径名称
 *
 *  @return  YES 创建成功，NO 创建失败
 */
- (BOOL)createFile:(NSString *)file;

/**
 *  删除目录
 *
 *  @param path 目录地址，可带子目录
 *
 *  @return YES 删除成功，NO 删除失败
 */
- (BOOL)removePath:(NSString *)path;

/**
 *  删除文件
 *
 *  @param file 文件全路径名称
 *
 *  @return  YES 删除成功，NO 删除失败
 */
- (BOOL)removeFile:(NSString *)file;

/**
 *  文件是否存在
 *
 *  @param filePath 文件全路径名称
 *
 *  @return 文件存在返回 YES，文件不存在返回 NO
 */
- (BOOL)isFileExist:(NSString *)filePath;

/**
 *  获得文件大小
 *
 *  @param file 文件全路径名称
 *
 *  @return 返回文件字节数大小，若文件不存在或获取失败返回0
 */
- (long long)getFileSize:(NSString *)file;

/**
 *  获取目录大小
 *
 *  @param path 目录地址，可带子目录
 *
 *  @return 返回目录字节数大小，若目录不存在或获取失败返回0
 */
- (long long)getPathSize:(NSString *)path;

/**
 *  拷贝文件到指定路径
 *
 *  @param srcPath 原文件路径
 *  @param toPath  目的地文件路径
 *
 *  @return 拷贝成功返回 YES，拷贝失败返回 NO
 */
- (BOOL)copyFile:(NSString *)srcPath toPath:(NSString *)toPath;


/**
 获取路径下所有文件

 */
- (NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path;


/**
 根据路径获取文件类型
 */
+ (CSYFileUtilFileType)getFileTypeWithFilePathStr:(NSString *)filePathStr;

/**
 根据 文件类型 获取文件类型图片
 */
+ (NSString *)getFileImageNameWithFileUtilFileType:(CSYFileUtilFileType )type;

/*
 获取指定文件名长度
 */
+ (NSString *)getFileNameWithFileName:(NSString *)fileName cout:(int)count;
@end

NS_ASSUME_NONNULL_END
