//
//  ViewController.m
//  KNSegmentView
//
//  Created by 刘凡 on 2017/11/3.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "KNSegmentView.h"

#define KSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define KSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface ViewController ()<KNSegmentViewDelegate>

@property(nonatomic, strong)KNSegmentView *segmentView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     NSArray * btnDataSource2 = @[@"未付款", @"已付款", @"待发货", @"待收货"];
    
    self.segmentView = [KNSegmentView SetKNSegmentViewFrame:CGRectMake(0,40, KSCREEN_WIDTH, 44) titletData:btnDataSource2 defalutColor:[UIColor blackColor] selectColor:[UIColor greenColor] titleFont:[UIFont systemFontOfSize:14] Delegate:self];
    
    
    [self.view addSubview:self.segmentView];
    
    
}

-(void)KNSegmentSelectionChange:(NSInteger)selection
{
    NSLog(@"现在选择的是 ---- %ld",selection);
}




@end
