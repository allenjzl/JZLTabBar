//
//  JZLTabBarItem.h
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZLTabBarItem : UIView
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIImageView *selectedImgView;
@property (nonatomic, assign) BOOL selected;
@end
