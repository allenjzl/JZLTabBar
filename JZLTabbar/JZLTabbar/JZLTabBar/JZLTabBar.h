//
//  JZLTabBar.h
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JZLTabBarDelegate <NSObject>

/** 选中tabbar */
- (void)selectedJZLTabBarItemAtIndex:(NSInteger)index;
@end

@interface JZLTabBar : UIView
@property (nonatomic, strong) NSMutableArray *itemArray;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *selectedImageArray;
@property (nonatomic, weak) id<JZLTabBarDelegate> delegate;
+ (instancetype)tabBarWithFrame:(CGRect)frame titleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *>*)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray;
@end
