//
//  XHJNavigationController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/7.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJNavigationController.h"

@interface XHJNavigationController ()

@end

@implementation XHJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//   当前stack中的vc的数目大于0时，说明不是rootViewController，所以在这里进行判断来决定是否影藏tabbar
    if (self.viewControllers.count > 0) {
//        在这里进行统一的返回的按钮的处理。
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor colorWithRed:1/255.0 green:1/255.0 blue:1/255.0 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:1 green:56/255.0 blue:35/255.0 alpha:1] forState:UIControlStateHighlighted];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 100, 30);
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        
    }
    
    self.tabBarController.tabBar.hidden = self.viewControllers.count > 0;
    [super pushViewController:viewController animated:animated];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
//   pop的时候修改tabBar的显示和影藏。
    self.tabBarController.tabBar.hidden = self.viewControllers.count > 2;
    return [super popViewControllerAnimated:animated];
}

- (void)pop{
    [self popViewControllerAnimated:YES];
}


@end
