//
//  JZLTabBarItem.m
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import "JZLTabBarItem.h"


@implementation JZLTabBarItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.titleLbl];
    [self addSubview:self.imgView];
    [self addSubview:self.selectedImgView];
    [self addSubview:self.badgeLbl];
    self.imgView.frame = CGRectMake(0, 0, 21.5, 22);
    self.imgView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 - 5);
    self.titleLbl.frame = CGRectMake(0, self.bounds.size.height - 12, self.bounds.size.width, 12);
    self.selectedImgView.frame = CGRectMake(0, 0, 32, 32);
    self.selectedImgView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2 );
    self.badgeLbl.center = CGPointMake((CGRectGetMaxX(self.imgView.frame) - 5), (self.imgView.bounds.origin.y) + 5);

    
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if (_selected) {
        self.selectedImgView.hidden = NO;
        [self animationWithSelectedImg];
        self.imgView.hidden = YES;
        self.titleLbl.hidden = YES;
    }else {
        self.selectedImgView.hidden = YES;
        self.imgView.hidden = NO;
        self.titleLbl.hidden = NO;
    }
    
}

/** 动画 */
- (void)animationWithSelectedImg {
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.15;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.8];
    pulse.toValue= [NSNumber numberWithFloat:1.2];
    [self.selectedImgView.layer addAnimation:pulse forKey:nil];
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.font = [UIFont systemFontOfSize:10];
        _titleLbl.textColor = [UIColor lightGrayColor];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.text = @"首页";
    }
    return _titleLbl;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.userInteractionEnabled = YES;
        
        
    }
    return _imgView;
}

- (UIImageView *)selectedImgView {
    if (!_selectedImgView) {
        _selectedImgView = [[UIImageView alloc] init];
        _selectedImgView.userInteractionEnabled = YES;
        _selectedImgView.hidden = YES;//选中图片默认隐藏
    }
    return _selectedImgView;
}

- (UILabel *)badgeLbl {
    if (!_badgeLbl) {
        _badgeLbl = [[UILabel alloc] init];
        _badgeLbl.font = [UIFont systemFontOfSize:12];
        _badgeLbl.textColor = [UIColor whiteColor];
        _badgeLbl.textAlignment = NSTextAlignmentCenter;
        _badgeLbl.hidden = YES;
        _badgeLbl.backgroundColor = [UIColor redColor];

    }
    return _badgeLbl;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self.badgeLbl sizeToFit];
    //为了左右两边切圆角留间距
    CGSize size = [@"#" sizeWithAttributes:@{NSFontAttributeName: self.badgeLbl.font}];
    float width = self.badgeLbl.bounds.size.width + size.width ;
    float height = self.badgeLbl.bounds.size.height ;
    if (width < height) {
        width = height;
    }
    self.badgeLbl.layer.cornerRadius = height / 2;
    self.badgeLbl.clipsToBounds = YES;
    CGRect frame = self.badgeLbl.frame;
    frame.size.width = width;
    frame.size.height = height;
    self.badgeLbl.frame = frame;
    
}

- (void)sizeToFit {
    [super sizeToFit];
    
}



@end






