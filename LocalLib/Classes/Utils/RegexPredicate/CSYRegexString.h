//
//  CSYRegexStr.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/10/8.
//

#import <Foundation/Foundation.h>
///// <#coce#>
//static NSString * const kEnterRegular<#coce#>Str = @"<#coce#>";

/// 名称
static NSString * const kEnterRegularNameStr = @"^.{0,10}$";
/// 名称
static NSString * const kRegularNameStr = @"^.{2,10}$";

/// 昵称
static NSString * const kEnterRegularNickNameStr = @"^.{0,10}$";

/// 邮箱
static NSString * const kEnterRegularEmailStr = @"[0-9a-zA-Z@._%+-]{0,50}";
/// 邮箱提交
static NSString * const kRegularEmailStr = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

/// 网址
static NSString * const kEnterRegularUrlStr = @".{0,50}";

/// 手机号
static NSString * const kEnterRegularMobileStr = @"1[\\d+]{0,10}$";
/// 手机号提交
static NSString * const kRegularMobileStr = @"1[\\d+]{0,10}$";

/// 验证码
static NSString * const kEnterRegularVerificationStr = @"[\\d+]{0,4}$";

/// 密码
static NSString * const kEnterRegularPasswordStr = @"[0-9A-Za-z]{0,20}$";
/// 密码提交
static NSString * const kRegularPasswordStr = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";

/// 身份证
static NSString * const kEnterRegularIdNumberStr = @"[0-9xX]{0,18}$";
/// 身份证提交
static NSString * const kRegularIdNumberStr = @"(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])$)";

/// 反馈
static NSString * const kEnterRegularFeedbackStr = @"^.{0,200}$";

/// 公司名称
static NSString * const kEnterRegularCompanyNameStr = @".{0,30}$";

/// 注册号
static NSString * const kEnterRegularRegistrationNumberStr = @"[0-9a-zA-Z]{0,18}";

/// 详细地址
static NSString * const kEnterRegularDetailAddressStr = @"^.{0,255}$";

/// 注册地址
static NSString * const kEnterRegularRegisteredAddressStr = @"^.{0,100}$";


/// 公司电话
static NSString * const kEnterRegularWorkPhoneStr = @"[0-9]{0,18}$";
/// 公司电话提交
static NSString * const kRegularWorkPhoneStr = @"[0-9]{11,18}$";

/// 公司规模
static NSString * const kEnterRegularBusinessScaleStr = @"^[1-9]{1}[0-9]{0,4}$";

/// 公司注册资本
static NSString * const kEnterRegularCompanyRegisteredCapitalStr = @"^[0-9.]{0,11}$";

/// 公司主营范围
static NSString * const kEnterRegularCompanyMainScopeStr = @"^.{0,200}$";

/// 公司简介
static NSString * const kEnterRegularCompanyProfileStr = @"^.{0,200}$";

/// 研究方向
static NSString * const kEnterRegularResearchDirectionStr = @"^.{0,50}$";

/// 开户行名称
static NSString * const kEnterRegularBankNameStr = @"^.{0,30}$";

/// 户号
static NSString * const kEnterRegularAccountNumberStr = @"^[0-9]{0,30}$";

/// 个人简介
static NSString * const kEnterRegularPersonProfileStr = @"^.{0,200}$";

/// 职位信息
static NSString * const kEnterRegularJobInformationStr = @"^.{0,50}$";

/// 标签
static NSString * const kEnterRegularTagStr = @"^.{0,6}$";

/// 讨论组名称
static NSString * const kEnterRegularDiscussionGroupNameStr = @"^.{0,20}$";

/// 讨论组描述
static NSString * const kEnterRegularDiscussionGroupDescriptionStr = @"^.{0,500}$";

/// 项目名称
static NSString * const kEnterRegularDemandNameStr = @"^.{0,30}$";

/// 项目描述
static NSString * const kEnterRegularDemandDescriptionStr = @"^.{0,500}$";

/// 银行卡号
static NSString * const kEnterRegularBankNoStr = @"^[0-9]{0,19}$";
static NSString * const kRegularBankNoStr = @"^[0-9]{16}|[0-9]{19}$";

/// 预算
static NSString * const kEnterRegularBudgetStr = @"^[0-9]{0,6}$";


/// 护照：
static NSString * const kEnterRegularPassportSr = @"^[0-9]{0,17}$";
/// 护照：提交
static NSString * const kRegularPassportSr = @"^[a-zA-Z0-9]{5,17}$";

/// 港澳居民通行证：
static NSString * const kEnterRegularHongKongPassportSr = @"^[0-9HMhm]{0,11}$";
/// 港澳居民通行证：提交
static NSString * const kRegularHongKongPassportSr = @"^[HMhm]{1}([0-9]{10}|[0-9]{8})$$";

/// 台湾居民通行证：
static NSString * const kEnterRegularTaiwanPassportSr = @"^[0-9a-zA-Z]{0,10}$";
/// 台湾居民通行证：提交
static NSString * const kRegularTaiwanPassportSr = @"(^[0-9]{8}$)|(^[0-9]{10}$)$";
