//
//  XHJTabBarController.m
//  MissU
//
//  Created by hongjunxiao on 16/2/6.
//  Copyright © 2016年 ihj. All rights reserved.
//

#import "XHJTabBarController.h"
#import "MeViewController.h"
#import "AttentionViewController.h"
#import "PublishViewController.h"
#import "NewestViewController.h"
#import "EssenceViewController.h"
#import "XHJTabBar.h"
#import "XHJNavigationController.h"
#import "XHJPublishView.h"

@interface XHJTabBarController ()

@end

@implementation XHJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self replaceTabBar];
    [self customTabBarItemAppearance];
    [self makeTabControllers];
}


- (void)replaceTabBar{
//    UITabbar如何设定他的尺寸呢？他的高度貌似是写死的。
    XHJTabBar *tabbar = [[XHJTabBar alloc] init];
    tabbar.backgroundColor = [UIColor redColor];
    tabbar.frame = CGRectMake(0, 0, ScreenWidth, 44);
    [self setValue:tabbar forKey:@"tabBar"];
}

- (void)customTabBarItemAppearance{
// 通过UITabbarItem的类方法的appearance的这个方法来获得全局的属性。
   UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor redColor]} forState:UIControlStateSelected];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} forState:UIControlStateNormal];
}

- (void)makeTabControllers{
//    NewestViewController *controller = [[NewestViewController alloc] init];
    [self makeTabController:[[EssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    [self makeTabController:[NewestViewController new] title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    [self makeTabController:[AttentionViewController new] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    [self makeTabController:[MeViewController new] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
}

- (void)makeTabController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    controller.tabBarItem.title = title;
    UIImage *origImage = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//  指定了图片的渲染模式。来防止图片被系统渲染成蓝色。(但是这个搞没有生效，所以现在image的属性里面改下，后面找找原因)
    controller.tabBarItem.image = origImage;
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    XHJNavigationController *nc = [[XHJNavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nc];
}

- (void)plusButtonDidClick{
//    NSLog(@"-----");
    XHJPublishView *publishView = [[XHJPublishView alloc] initWithFrame:self.view.frame];
//    UIWindow *keyWindow =
    [[UIApplication sharedApplication].keyWindow addSubview:publishView];
}


@end
