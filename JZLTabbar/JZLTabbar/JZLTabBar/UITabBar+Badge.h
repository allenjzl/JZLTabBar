//
//  UITabBar+Badge.h
//  JZLTabbar
//
//  Created by allenjzl on 2018/7/7.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

/**
 设置角标

 @param badge 角标值
 @param index tabbar的位置
 */
- (void)showBadge:(NSString *)badge atIndex:(NSInteger)index;

/**
 自定义角标背景,字体颜色

 @param badge 角标值
 @param badgeColor 角标字体颜色
 @param backgroundColor 角标背景颜色
 @param index tabbar位置
 */
- (void)showBadge:(NSString *)badge badgeColor:(UIColor *)badgeColor badgeBackgroundColor:(UIColor *)backgroundColor atIndex:(NSInteger)index;

/**
 清除角标

 @param index tabbar位置
 */
- (void)clearBadgeAtIndex:(NSInteger)index;

@end
