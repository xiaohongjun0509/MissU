//
//  XHJLeftViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJLeftViewController.h"
#import "XHJLeftCell.h"
#import "XHJLeftCatagoryModel.h"
@interface XHJLeftViewController ()
@property (nonatomic, strong) NSMutableArray *catagoryList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XHJLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[XHJLeftCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self startRequest];
}


- (void)startRequest{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    WEAKSELF
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:@{@"a":@"category",@"c":@"subscribe"} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
//        这个能不能换到XHJLeftCatagoryModel来实现
        [XHJLeftCatagoryModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"catagoryId" : @"id"};
        }];
        weakSelf.catagoryList = [XHJLeftCatagoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [weakSelf.tableView reloadData];
//       异步刷新，为什么这个时候调用下面的方法会生效？
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        if (self.clickBlock) {
            XHJLeftCatagoryModel *model = self.catagoryList[0];
            self.clickBlock(model.catagoryId);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}



#pragma mark tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XHJLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    XHJLeftCatagoryModel *model = self.catagoryList[indexPath.row];
    cell.model = model;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [XHJLeftCell height];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.catagoryList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.clickBlock) {
        XHJLeftCatagoryModel *model = self.catagoryList[indexPath.row];
        self.clickBlock(model.catagoryId);
    }
}
@end
