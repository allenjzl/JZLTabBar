//
//  JZLTabBarItem.h
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZLTabBarItem : UIView
/** 标题 */
@property (nonatomic, strong) UILabel *titleLbl;
/** 图片 */
@property (nonatomic, strong) UIImageView *imgView;
/** 选中的图片 */
@property (nonatomic, strong) UIImageView *selectedImgView;
/** 角标 */
@property (nonatomic, strong) UILabel *badgeLbl;
@property (nonatomic, assign) BOOL selected;
@end
