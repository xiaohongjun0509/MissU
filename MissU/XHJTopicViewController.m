//
//  XHJTopicViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTopicViewController.h"
#import "XHJTopicModel.h"
#import "MJRefresh.h"
#import "XHJTweetCell.h"
@interface XHJTopicViewController ()
@property (nonatomic, strong) NSMutableArray *resultList;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, copy) NSString *maxtime;
@end

@implementation XHJTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultList = [NSMutableArray array];
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 44 , 0, 49, 0);
    self.tableView.backgroundColor = BGCOLOR;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XHJTweetCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopic)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopic)];
}


- (void)loadNewTopic{
    WEAKSELF
    [NetworkManager startRequest:@{@"a":@"list",@"c":@"data",@"type":[self topicType]} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [self.tableView.mj_header endRefreshing];
//      下拉刷新后将page置为1；
        weakSelf.page = 1;
        [weakSelf.resultList removeAllObjects];
        
        [weakSelf praseResult:responseObject];
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreTopic{
    WEAKSELF
    [NetworkManager startRequest:@{@"a":@"list",@"c":@"data",@"type":[self topicType],@"page":@(self.page),@"maxtime":self.maxtime} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [weakSelf.tableView.mj_footer endRefreshing];
        weakSelf.page++;
        [weakSelf praseResult:responseObject];
        [weakSelf.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        [self.tableView.mj_header endRefreshing];
    }];
}


- (void)praseResult:(NSDictionary *)dict{
    NSArray *result = [XHJTopicModel mj_objectArrayWithKeyValuesArray:dict[@"list"]];
    [self.resultList addObjectsFromArray:result];
    self.maxtime = dict[@"info"][@"maxtime"];
}
- (NSString *)topicType{
    return nil;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.resultList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XHJTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.resultList[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XHJTopicModel *model = self.resultList[indexPath.row];
    return model.rowHeight;
}



@end
