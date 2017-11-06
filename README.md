# KNSegmentView

### 写一个简单的选择栏。可以使用UIPageViewController作为载体。 放入UIVeiwController

## 1.放一个效果图

![](https://github.com/krystalName/KNSegmentView/blob/master/SegmentView.gif)


使用代码如下

``` objc 

  NSArray * btnDataSource2 = @[@"第一条", @"第二条", @"第三条", @"第四条"];
    
    //参数列表。位置。大小。 显示数据 。 默认字体颜色  选中字体颜色  字体大小  代理
    self.segmentView = [KNSegmentView SetKNSegmentViewFrame:CGRectMake(0,40, KSCREEN_WIDTH, 44) titletData:btnDataSource2 defalutColor:[UIColor blackColor] selectColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:14] Delegate:self];
    [self.view addSubview:self.segmentView];
    
```
