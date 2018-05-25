//
//  RootViewController.m
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "JZLTabBar.h"

@interface RootViewController ()<JZLTabBarDelegate>
@property (nonatomic, strong) FirstViewController *firstVC;
@property (nonatomic, strong) SecondViewController *secondVC;
@property (nonatomic, strong) ThirdViewController *thirdVC;
@property (nonatomic, strong) FourthViewController *fourthVC;
@property (nonatomic, strong) FifthViewController *fifthVC;
@property (nonatomic, strong) JZLTabBar *JZLTabBar;
@property (nonatomic, strong) NSMutableArray *viewControllerCountArray;
@end

@implementation RootViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 2.删除自动创建的tabBarButton
    for (UIView *view in [self.tabBar.subviews copy]) {
        [view removeFromSuperview];
    }
    // 把self.wj_tabBar添加到视图上
    [self.tabBar addSubview:self.JZLTabBar];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatChildVC];
}

#pragma mark - 创建子控制器
- (void)creatChildVC {
    self.firstVC = [[FirstViewController alloc] init];
    self.secondVC = [[SecondViewController alloc] init];
    self.thirdVC = [[ThirdViewController alloc] init];
    self.fourthVC = [[FourthViewController alloc] init];
    self.fifthVC = [[FifthViewController alloc] init];
        [self creatTagbBarWithChildVCArray:@[self.firstVC,self.secondVC,self.thirdVC,self.fourthVC,self.fifthVC] titleArray:@[@"首页",@"附近",@"分类",@"订单",@"我的"] imageArray:@[@"home-normal",@"near-normal",@"fenlei-normal",@"shopping-normal",@"Personalcenter-normal"] selectedImageArray:@[@"home-Selected",@"near-selected",@"fenlei-Selected",@"shopping-selected",@"Personalcenter-selected"]];
}

//添加子模块
- (void)creatTagbBarWithChildVCArray:(NSArray <UIViewController *>*)childVCArray titleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *>*)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray {
    for (UIViewController *viewController in childVCArray) {
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [self.viewControllerCountArray addObject:navigationController];
    }
    self.JZLTabBar = [JZLTabBar tabBarWithFrame:self.tabBar.bounds titleArray:titleArray imageArray:imageArray selectedImageArray:selectedImageArray];
    self.JZLTabBar.delegate = self;
    self.viewControllers = self.viewControllerCountArray;
    self.selectedIndex = 0;
}


#pragma mark - cansTabBarDelegate
- (void)selectedJZLTabBarItemAtIndex:(NSInteger)index {
    self.selectedIndex = index;
}


#pragma mark - 重写selectedIndex的set方法
- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    self.JZLTabBar.selectedIndex = selectedIndex;
}





- (NSMutableArray *)viewControllerCountArray {
    if (!_viewControllerCountArray) {
        _viewControllerCountArray = [[NSMutableArray alloc] init];
    }
    return _viewControllerCountArray;
}


@end













