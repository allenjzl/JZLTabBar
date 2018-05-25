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
        JZLTabBarItem *item = [[JZLTabBarItem alloc] init];
        item.imgView.image = [UIImage imageNamed:self.imageArray[i]];
        item.selectedImgView.image = [UIImage imageNamed:self.selectedImageArray[i]];
        item.titleLbl.text = self.titleArray[i];
        item.tag = i ;
        item.frame = CGRectMake(i * (SCREEN_WIDTH / self.titleArray.count), 0, (SCREEN_WIDTH / self.titleArray.count), 49);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemAction:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        [self.itemArray addObject:item];
    }
    self.selectedIndex = 0;
}

- (void)itemAction:(UITapGestureRecognizer *)sender {
    self.selectedIndex = sender.view.tag;
    if ([self.delegate respondsToSelector:@selector(selectedJZLTabBarItemAtIndex:)]) {
        [self.delegate selectedJZLTabBarItemAtIndex:sender.view.tag];
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
