//
//  XHJTAllController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/16.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJAllController.h"

@interface XHJAllController ()

@end

@implementation XHJAllController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 44 , 0, 49, 0);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text  =[NSString stringWithFormat:@"%@----%zd",[self class],indexPath.row] ;
    return cell;
}

@end
