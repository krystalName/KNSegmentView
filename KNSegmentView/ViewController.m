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
#import "KNSanVC.h"
#import "KNSiVC.h"

#define KSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define KSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<KNSegmentViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property(nonatomic, strong)KNSegmentView *segmentView;

@property(nonatomic, strong)UIPageViewController  *PageView;

@property(nonatomic, strong)NSArray *pageArray;

@property(nonatomic, assign)NSInteger IndexPage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _IndexPage = 0;
    //创建选择页面
     NSArray * btnDataSource2 = @[@"第一条", @"第二条",@"第三条",@"第四条"];
    self.segmentView = [KNSegmentView SetKNSegmentViewFrame:CGRectMake(0,44, KSCREEN_WIDTH, 44) titletData:btnDataSource2 defalutColor:[UIColor blackColor] selectColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:14] Delegate:self];
    [self.view addSubview:self.segmentView];
    
 
//    添加pageViewController.view
    [self addChildViewController:self.PageView];
    [self.PageView didMoveToParentViewController:self];
    [self.view addSubview:self.PageView.view];
    [self.PageView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(self.segmentView.mas_bottom);
    }];
}

-(void)KNSegmentSelectionChange:(NSInteger)selection
{
    NSInteger index = selection;
    [self.PageView setViewControllers:@[self.pageArray[index]] direction:index<_IndexPage animated:YES completion:^(BOOL finished){
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




-(UIPageViewController *)PageView{
    if (!_PageView) {
        
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMid] forKey:UIPageViewControllerOptionSpineLocationKey];
        
        _PageView = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        //设置当前的页面
       [_PageView setViewControllers:@[self.pageArray[_IndexPage]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
        _PageView.dataSource = self;
        _PageView.delegate = self;
    }
    return _PageView;
}


-(NSArray <UIViewController *> *)pageArray{
    
    if (!_pageArray) {
    
        _pageArray = @[[[KNOneVC alloc]init],
                       [[KNNextVC alloc]init],
                       [[KNSanVC alloc]init],
                       [[KNSiVC alloc]init]];
    }
    return _pageArray;
}

@end
