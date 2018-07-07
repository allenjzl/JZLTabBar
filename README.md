# JZLTabBar

2018.7.7更新
1.更改masonry约束布局为frame布局
2.支持设置角标
3.支持自定义角标颜色和背景颜色
4.支持清除角标



自定义类似淘宝TabBar
公司的项目需求是tabbar和淘宝的类似,那么系统的就满足不了需求,就需要自己去自定义,也参考了网上部分资料,完成之后自己稍微抽取了 一下,有需要的朋友可以下载使用,(tabBarController也在里面,如果没有特殊要求,可以直接使用tabBarController做跟控制器,也可以把先关代码放入自己的tabBarController)如果发现问题,请留言,我会继续改进
效果图:


思路:
1.移除系统tabbar的所有子控件,然后把自定义的tabbar添加到系统上面
```
//删除系统tabbar的UITabBarButton
- (void)layoutSubviews {
[super layoutSubviews];
for (UIView *view in self.subviews) {
if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
[view removeFromSuperview];
}
}
}
```
2.自定义的tabBar实例化(传入title,图片和选中图片数组)
```
    self.JZLTabBar = [JZLTabBar tabBarWithFrame:self.tabBar.bounds titleArray:titleArray imageArray:imageArray selectedImageArray:selectedImageArray];
    self.JZLTabBar.delegate = self;
```
3.增加了UITabBar的分类,用来处理角标设置
3.1 设置角标
```
/**
设置角标

@param badge 角标值
@param index tabbar的位置
*/
- (void)showBadge:(NSString *)badge atIndex:(NSInteger)index;

```

3.2 自定义角标颜色和背景颜色
```
/**
自定义角标背景,字体颜色

@param badge 角标值
@param badgeColor 角标字体颜色
@param backgroundColor 角标背景颜色
@param index tabbar位置
*/
- (void)showBadge:(NSString *)badge badgeColor:(UIColor *)badgeColor badgeBackgroundColor:(UIColor *)backgroundColor atIndex:(NSInteger)index;
```
3.3 清除角标
```
/**
清除角标

@param index tabbar位置
*/
- (void)clearBadgeAtIndex:(NSInteger)index;
```
Tip:用设置角标的方法,角标设置为0同样可以清除角标,我也单拿出来一个方法,这样看起来更清晰

