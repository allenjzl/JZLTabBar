//
//  JZLTabBar.m
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//
#define SCREEN_WIDTH                       ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                      ([UIScreen mainScreen].bounds.size.height)


#import "JZLTabBar.h"
#import "JZLTabBarItem.h"

@implementation JZLTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

//删除系统tabbar的UITabBarButton
- (void)layoutSubviews {
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

+ (instancetype)tabBarWithFrame:(CGRect)frame titleArray:(NSArray <NSString *> *)titleArray imageArray:(NSArray <NSString *>*)imageArray selectedImageArray:(NSArray <NSString *> *)selectedImageArray {
    JZLTabBar *tabBar = [[JZLTabBar alloc] initWithFrame:frame];
    tabBar.titleArray = titleArray;
    tabBar.imageArray = imageArray;
    tabBar.selectedImageArray = selectedImageArray;
    [tabBar setupUI];
    return tabBar;
    
    
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < self.titleArray.count; i++) {
        JZLTabBarItem *item = [[JZLTabBarItem alloc] initWithFrame:CGRectMake(i * (SCREEN_WIDTH / self.titleArray.count), 0, (SCREEN_WIDTH / self.titleArray.count), 49)];
        item.imgView.image = [UIImage imageNamed:self.imageArray[i]];
        item.selectedImgView.image = [UIImage imageNamed:self.selectedImageArray[i]];
        item.titleLbl.text = self.titleArray[i];
        item.tag = i ;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemAction:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        [self.itemArray addObject:item];
    }
    self.selectedIndex = 0;
}

- (void)itemAction:(UITapGestureRecognizer *)sender {
    self.selectedIndex = sender.view.tag;
    if ([self.JZLTabBarDelegate respondsToSelector:@selector(selectedJZLTabBarItemAtIndex:)]) {
        [self.JZLTabBarDelegate selectedJZLTabBarItemAtIndex:sender.view.tag];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self.itemArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        JZLTabBarItem *item = (JZLTabBarItem *)obj;
        if (idx == selectedIndex) {
            item.selected = YES;
        }else {
            item.selected = NO;
        }
    }];
    
}

#pragma mark - 设置角标
- (void)showBadge:(NSString *)badge atIndex:(NSInteger)index {
    [super showBadge:badge atIndex:index];
    if (index >= self.itemArray.count) {
        return;
    }
    JZLTabBarItem * item = self.itemArray[index];
    //角标为0,自动隐藏
    if ([badge integerValue] == 0) {
        item.badgeLbl.hidden = YES;
    }else {
        item.badgeLbl.hidden = NO;
        item.badgeLbl.text = badge;
    }
    [item setNeedsLayout];
    [item layoutIfNeeded];
    
}

#pragma mark - 自定义角标颜色和背景颜色
- (void)showBadge:(NSString *)badge badgeColor:(UIColor *)badgeColor badgeBackgroundColor:(UIColor *)backgroundColor atIndex:(NSInteger)index {
    [super showBadge:badge badgeColor:badgeColor badgeBackgroundColor:backgroundColor atIndex:index];
    if (index >= self.itemArray.count) {
        return;
    }
    JZLTabBarItem * item = self.itemArray[index];
    //角标为0,自动隐藏
    if ([badge integerValue] == 0) {
        item.badgeLbl.hidden = YES;
    }else {
        item.badgeLbl.hidden = NO;
        item.badgeLbl.text = badge;
        item.badgeLbl.textColor = badgeColor;
        item.badgeLbl.backgroundColor = backgroundColor;
    }
    [item setNeedsLayout];
    [item layoutIfNeeded];
}

#pragma mark - 清除角标
- (void)clearBadgeAtIndex:(NSInteger)index {
    [super clearBadgeAtIndex:index];
    if (index >= self.itemArray.count) {
        return;
    }
    JZLTabBarItem * item = self.itemArray[index];
    item.badgeLbl.text = nil;
    item.badgeLbl.hidden = YES;
}


#pragma mark - lazy
- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}

- (NSArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSArray array];
    }
    return _imageArray;
}

- (NSArray *)selectedImageArray {
    if (!_selectedImageArray) {
        _selectedImageArray = [NSArray array];
    }
    return _selectedImageArray;
}


@end
