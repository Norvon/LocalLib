//
//  CSYHomeSearchVC.m
//  OrangeCDSCounselor
//
//  Created by Norvon on 2020/2/26.
//  Copyright © 2020 Norvon. All rights reserved.
//

#import "CSYBaseSearchHistoryVC.h"

// view
#import "CSYSearchHeader.h"
#import "CSYSearchHistoryTableHeader.h"
#import "CSYSearchHistoryCell.h"

// other
#import <YYCache/YYCache.h>
#import <Toast/UIView+Toast.h>
#import "UtilMacros.h"
#import "ColorMacros.h"
#import "UIView+LayoutMethods.h"

@interface CSYBaseSearchHistoryVC ()
<
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate
>

@property (nonatomic, strong) UIView *contentView;
/// 显示历史
@property (nonatomic, strong) UITableView * historyTable;

@property (nonatomic, strong) CSYSearchHistoryTableHeader *searchHistoryTableHeader;
@property (nonatomic, strong) CSYSearchHeader *searchHeader;
@property (nonatomic, assign) CGFloat searchCellHeight;
/// 历史数据
@property (nonatomic, strong) NSMutableArray *historyArr;

@property (nonatomic, assign) BOOL showResultTable;


@end

@implementation CSYBaseSearchHistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];

    self.historyArr = [NSMutableArray array];
    [self.searchHeader.searchTextField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];    
}

#pragma mark - setter
- (void)setSearchPlaceholder:(NSString *)searchPlaceholder {
    _searchPlaceholder = searchPlaceholder;
    
    self.searchHeader.searchTextField.placeholder = searchPlaceholder;
}

#pragma mark - table的显示
- (void)setShowResultTable:(BOOL)showResultTable {
    _showResultTable = showResultTable;

    // 获取数据
    self.historyArr = [self localHistoryArr].mutableCopy;

    self.historyTable.hidden = showResultTable;

    self.resultVC.view.hidden = !showResultTable;
}

- (void)showResultWithTitle:(NSString *)title {

    if (!title) {
        return;
    }

    [self.searchHeader.searchTextField resignFirstResponder];

    // 处理历史数据和保存
    [self handleHistoryArrAndSaveHistoryArrWithTitle:title];

    // 传递搜索内容进行接口请求
    self.resultVC.searchStr = title;

    // 隐藏历史table
    self.showResultTable = YES;
}

/// 删除重复的数据重新加入
- (void)handleHistoryArrAndSaveHistoryArrWithTitle:(NSString *)title {
    // 存储数据
    if ([self.historyArr containsObject:title]) {
        [self.historyArr removeObject:title];
    }

    [self.historyArr insertObject:title atIndex:0];
    [self saveHistoryArr:self.historyArr.copy];
}

#pragma mark - 历史数据存取
/// 存储数据
- (void)saveHistoryArr:(NSArray *)historyArr {
    // 子类实现
}

/// 取出数据
- (NSArray *)localHistoryArr {
    // 子类实现
    return @[];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Class class = [CSYSearchHistoryCell class];
    CSYSearchHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    cell.btnTitleArray = [self.historyArr copy];
    self.searchCellHeight = [cell cellHeight];

    __weak typeof(self)weakSelf = self;
    cell.callBackBlock = ^(NSUInteger idx) {

        if (idx >= weakSelf.historyArr.count) {
            return ;
        }

        weakSelf.searchHeader.searchTextField.text = weakSelf.historyArr[idx];
        [weakSelf showResultWithTitle:weakSelf.historyArr[idx]];
    };

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.searchCellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.searchHistoryTableHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .1f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.showResultTable = NO;
    [self.historyTable reloadData];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    NSString *text = textField.text;
    if (text.length <= 0) {

        [self.view makeToast:self.noSearchTipStr ? : @"请输入搜索内容"];

        return NO;
    }

    [textField resignFirstResponder];
    DLog(@"点击了搜索");
    [self showResultWithTitle:textField.text];
    return YES;
}

#pragma mark - 清除历史记录
- (void)cleanHistory {
    DLog(@"清除历史记录");
    [self saveHistoryArr:@[]];
    [self.historyArr removeAllObjects];
    [self.historyTable reloadData];
}

#pragma mark - 返回
- (void)popView {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - init
- (void)initView {
    self.navigationController.navigationBar.hidden = YES;
    self.navigationItem.title = @"搜索";

    [self.view addSubview:self.contentView];
    [self.view addSubview:self.searchHeader];

    [self.contentView addSubview:self.historyTable];
}


- (void)setResultVC:(CSYBaseSearchResultVC *)resultVC {
    _resultVC = resultVC;
    resultVC.view.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);
    resultVC.view.hidden = YES;

    [self addChildViewController:_resultVC];

    [self.contentView addSubview:resultVC.view];
}

#pragma mark - 实例
- (CSYSearchHeader *)searchHeader {
    if (_searchHeader) {
        return _searchHeader;
    }

    _searchHeader = [[CSYSearchHeader alloc] initWithFrame:CGRectMake(0, 0, kFullScreenWidth, kTopHeight)];
    _searchHeader.searchTextField.delegate = self;

    __weak typeof(self)weakSelf = self;
    _searchHeader.callBackBlock = ^{
        [weakSelf popView];
    };

    return _searchHeader;
}

- (UIView *)contentView {
    if (_contentView) {
        return _contentView;
    }

    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, kTopHeight, kFullScreenWidth, kScreenHeight - kTopHeight)];

    return _contentView;
}

- (CSYSearchHistoryTableHeader *)searchHistoryTableHeader {
    if (_searchHistoryTableHeader) {
        return _searchHistoryTableHeader;
    }

    _searchHistoryTableHeader = [[CSYSearchHistoryTableHeader alloc] initWithFrame:CGRectMake(0, 0, kFullScreenWidth, 44)];
    _searchHistoryTableHeader.backgroundColor = kCSYColorF5F5F5;

    __weak typeof(self)weakSelf = self;
    _searchHistoryTableHeader.callBackBlock = ^{
        [weakSelf cleanHistory];
    };

    return _searchHistoryTableHeader;
}

- (UITableView *)historyTable {
    if (_historyTable) {
        return _historyTable;
    }

    _historyTable = [CSYBaseTableViewFactory createDefaultTableViewWithFrame:self.contentView.bounds
                                                                 delegate:self
                                                               dataSource:self
                                                                    style:UITableViewStylePlain];

    [_historyTable registerClass:[CSYSearchHistoryCell class] forCellReuseIdentifier:NSStringFromClass([CSYSearchHistoryCell class])];
    _historyTable.hidden = YES;

    return _historyTable;
}


@end
