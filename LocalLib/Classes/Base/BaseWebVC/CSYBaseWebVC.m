//
//  CSYBaseWebVC.m
//  OrangeCDSDesign
//
//  Created by nor on 2019/8/23.
//

#import "CSYBaseWebVC.h"

#import <WebKit/WebKit.h>
#import <Toast/UIView+Toast.h>
#import <Masonry/Masonry.h>
#import "UtilMacros.h"
#import "ColorMacros.h"


@interface CSYBaseWebVC ()
<
WKNavigationDelegate,
WKUIDelegate
>
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation CSYBaseWebVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
    [self loadRequest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self addObserver];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self delObserver];
}

#pragma mark - load
- (void)loadRequest {

    if (!self.url || [self.url isKindOfClass:[NSURL class]] == NO) {
        [self loadFile];
        return;
    }

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:0];
    [self.webView loadRequest:request];
}

- (void)loadFile {
    [self.view makeToast:@"加载失败"];
}

#pragma mark - observe
- (void)addObserver {
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)delObserver {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        CGFloat progress = [change[NSKeyValueChangeNewKey] floatValue];
        [self.progressView setProgress:progress animated:YES];
        if(progress == 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [self.progressView setProgress:0.0 animated:NO];
            });
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - 返回
- (void)backClick:(UIButton *)sender {
    
    if([_webView canGoBack]) {
        [_webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    SEL sel = @selector(backClick:);
    return [super rt_customBackItemWithTarget:self action:sel];
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [self loadFile];
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {

}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if (webView.title.length) {
        self.navigationItem.title = webView.title;
    }
}

//提交发生错误时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self loadFile];
}

// 接收到服务器跳转请求即服务重定向时之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
}

// 根据WebView对于即将跳转的HTTP请求头信息和相关信息来决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {


    decisionHandler(WKNavigationActionPolicyAllow);
}

// 根据客户端受到的服务器响应头以及response相关信息来决定是否可以跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {

    NSString * urlStr = navigationResponse.response.URL.absoluteString;
    DLog(@"当前跳转地址：%@",urlStr);

    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
}

//// 需要响应身份验证时调用 同样在block中需要传入用户身份凭证
//- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
//    //用户身份信息
//    NSURLCredential * newCred = [[NSURLCredential alloc] initWithUser:@"user123" password:@"123" persistence:NSURLCredentialPersistenceNone];
//    //为 challenge 的发送方提供 credential
//    [challenge.sender useCredential:newCred forAuthenticationChallenge:challenge];
//    completionHandler(NSURLSessionAuthChallengeUseCredential,newCred);
//}

// 进程被终止时调用
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView{

}

#pragma mark - init
- (void)initView {
    [self.view addSubview:self.webView];
    [self.navigationController.view addSubview:self.progressView];

    [self setupUI];
}

- (void)setupUI {

    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kTopHeight);
        make.left.bottom.right.equalTo(self.view);
    }];

}

#pragma mark - 实例
- (WKWebView *)webView {
    if (_webView) {
        return _webView;
    }

    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];

    _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    _webView.allowsBackForwardNavigationGestures = NO;

    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

    return _webView;
}

- (UIProgressView *)progressView {
    if (_progressView) {
        return _progressView;
    }
    
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, kTopHeight - 2, self.view.bounds.size.width, 2)];
    _progressView.progressViewStyle = UIProgressViewStyleBar;
    _progressView.progressTintColor = kCSYColorEA5504;
    
    return _progressView;
}
@end
