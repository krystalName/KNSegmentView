# KNSegmentView

### 写一个简单的选择栏。可以使用UIPageViewController作为载体。 放入UIVeiwController

## 1.放一个效果图

![](https://github.com/krystalName/KNSegmentView/blob/master/segment.gif)

2.支持修改背景颜色
3.支持修改选中线条的颜色
4.支持修改默认选中项。 默认选中第一个

使用代码如下

``` objc 

  NSArray * btnDataSource2 = @[@"第一条", @"第二条", @"第三条", @"第四条"];
    
    //参数列表。位置。大小。 显示数据 。 默认字体颜色  选中字体颜色  字体大小  代理
    self.segmentView = [KNSegmentView SetKNSegmentViewFrame:CGRectMake(0,40, KSCREEN_WIDTH, 44) titletData:btnDataSource2 defalutColor:[UIColor blackColor] selectColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:14] Delegate:self];
    [self.view addSubview:self.segmentView];
    
    //    添加pageViewController.view
    [self addChildViewController:self.PageView];
    [self.PageView didMoveToParentViewController:self];
    [self.view addSubview:self.PageView.view];
    [self.PageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.segmentView.mas_bottom);
    }];
    
```
### 如需达到效果。要配合UIPageController 使用。  就能达到点击切换页面也滑动切换页面一起 详细实现代码请下载观看

```objc

//selection 为选中的下标
-(void)KNSegmentSelectionChange:(NSInteger)selection
{
     NSInteger index = selection;
    [self.PageView setViewControllers:@[self.pageArray[index]] direction:index<_IndexPage animated:YES completion:^(BOOL        finished){
        _IndexPage = selection;
    }];
}

#pragma mark --UIPageViewController代理----
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.pageArray indexOfObject:viewController];
    if (index + 1 == self.pageArray.count) {
        return nil;
    }
    return self.pageArray[index+1];
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.pageArray indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return self.pageArray[index-1];
}


-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    _IndexPage = [self.pageArray indexOfObject:pageViewController.viewControllers[0]];
    [_segmentView setSelectFotIndex:_IndexPage];
}

```

