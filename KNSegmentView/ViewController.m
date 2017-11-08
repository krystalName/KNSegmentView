//
//  ViewController.m
//  KNSegmentView
//
//  Created by 刘凡 on 2017/11/3.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "KNSegmentView.h"
#import "KNNextVC.h"
#import "KNOneVC.h"
#import "Masonry.h"

#define KSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define KSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<KNSegmentViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property(nonatomic, strong)KNSegmentView *segmentView;

@property(nonatomic, strong)UIPageViewController  *PageView;

@property(nonatomic, strong)NSMutableArray *pageArray;

@property(nonatomic, assign)NSInteger IndexPage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据源
    [self CreateVCArray];
    _IndexPage = 0;
    //创建选择页面
     NSArray * btnDataSource2 = @[@"第一条", @"第二条"];
    self.segmentView = [KNSegmentView SetKNSegmentViewFrame:CGRectMake(0,44, KSCREEN_WIDTH, 44) titletData:btnDataSource2 defalutColor:[UIColor blackColor] selectColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:14] Delegate:self];
    [self.view addSubview:self.segmentView];
    
 
    //添加pageViewController.view
    [self.view addSubview:self.PageView.view];
    [self.PageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.segmentView.mas_bottom);
    }];
}

-(void)CreateVCArray{
    _pageArray = [NSMutableArray array];
    
    KNOneVC * oneVC = [[KNOneVC alloc]init];
    [_pageArray addObject:oneVC];
    
    KNNextVC * nextVC = [[KNNextVC alloc]init];
    [_pageArray addObject:nextVC];
}

-(void)KNSegmentSelectionChange:(NSInteger)selection
{
    
    [_PageView setViewControllers:@[_pageArray[selection]] direction:index<selection animated:YES completion:^(BOOL finished){
        _IndexPage = selection;
    }];
}

#pragma mark --UIPageViewController代理----
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [_pageArray indexOfObject:viewController];
    if (index+1 == _pageArray.count) {
        return nil;
    }
    return _pageArray[index+1];
}
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [_pageArray indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    return _pageArray[index-1];
}


-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    _IndexPage = [_pageArray indexOfObject:pageViewController.viewControllers[0]];
    [_segmentView setSelectFotIndex:_IndexPage];
}




-(UIPageViewController *)PageView{
    if (!_PageView) {
        
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMid] forKey:UIPageViewControllerOptionSpineLocationKey];
        
        _PageView = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        //设置当前的页面
       [_PageView setViewControllers:_pageArray[_IndexPage] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
        _PageView.dataSource = self;
        _PageView.delegate = self;
    }
    return _PageView;
}


@end
