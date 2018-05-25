//
//  JZLTabBarItem.m
//  JZLTabbar
//
//  Created by allenjzl on 2018/5/25.
//  Copyright © 2018年 com.CansLife. All rights reserved.
//

#import "JZLTabBarItem.h"
#import "Masonry.h"

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

    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self);
        make.left.mas_equalTo(self);
    }];
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(self.titleLbl.mas_top).mas_offset(-5);
        make.width.mas_equalTo(21.5);
        make.height.mas_equalTo(22);
    }];
    
    [self.selectedImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.width.height.mas_equalTo(32);
    }];
    
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


@end
