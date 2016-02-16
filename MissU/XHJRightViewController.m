//
//  XHJRightViewController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/15.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJRightViewController.h"
#import "XHJRightCell.h"
#import "XHJRightDetailModel.h"
#import "XHJDetailLIstModel.h"

@interface XHJRightViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) XHJRightDetailModel *detailModel;
@end

@implementation XHJRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XHJRightCell class]) bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)requestWithCategoryId:(NSString *)uid{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    WEAKSELF
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:@{@"a":@"list",@"c":@"subscribe",@"category_id" :uid} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        [XHJRightDetailModel mj_setupObjectClassInArray:^NSDictionary*{
            return @{@"list" :@"XHJDetailLIstModel"};
        }];
        weakSelf.detailModel = [XHJRightDetailModel mj_objectWithKeyValues:responseObject];
        [weakSelf.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XHJRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}


@end
