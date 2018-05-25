# JZLTabBar
自定义类似淘宝TabBar
公司的项目需求是tabbar和淘宝的类似,那么系统的就满足不了需求,就需要自己去自定义,也参考了网上部分资料,完成之后自己稍微抽取了 一下,有需要的朋友可以下载使用,(tabBarController也在里面,如果没有特殊要求,可以直接使用tabBarController做跟控制器,也可以把先关代码放入自己的tabBarController)如果发现问题,请留言,我会继续改进
效果图:
![JZLTabBar.gif](https://upload-images.jianshu.io/upload_images/2278500-1f9bc24860e7cbdb.gif?imageMogr2/auto-orient/strip)

思路:
1.移除系统tabbar的所有子控件,然后把自定义的tabbar添加到系统上面
```
    // 2.删除自动创建的tabBarButton
    for (UIView *view in [self.tabBar.subviews copy]) {
        [view removeFromSuperview];
    }
    // 把self.wj_tabBar添加到视图上
    [self.tabBar addSubview:self.JZLTabBar];
```
2.自定义的tabBar实例化(传入title,图片和选中图片数组)
```
    self.JZLTabBar = [JZLTabBar tabBarWithFrame:self.tabBar.bounds titleArray:titleArray imageArray:imageArray selectedImageArray:selectedImageArray];
    self.JZLTabBar.delegate = self;
```
3.自定义的封装,布局方面用了masonry,后期会改为frame布局
