//
//  KNSegmentView.h
//  KNSegmentView
//
//  Created by 刘凡 on 2017/11/3.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol KNSegmentViewDelegate <NSObject>

@optional

-(void)KNSegmentSelectionChange:(NSInteger)selection;

@end


@interface KNSegmentView : UIView


//代理委托
@property(nonatomic, strong) id<KNSegmentViewDelegate> delegate;


/**
 初始化方法

 @param frame 设置大小位置
 @param TitleArray 设置内容数组
 @param delegate 代理委托
 @return 返回自己
 */
+(KNSegmentView *)SetKNSegmentViewFrame:(CGRect)frame titletData:(NSArray <NSString *> *)TitleArray
                             Delegate:(id)delegate;

///背景颜色
@property(nonatomic, strong)UIColor *bakeGroundColor;
///默认颜色
@property(nonatomic, strong)UIColor *defaultColor;
///选中颜色
@property(nonatomic, strong)UIColor *selectColor;
///底部线条View
@property(nonatomic, strong)UIColor *downLienColor;
///字体大小
@property(nonatomic, strong)UIFont  *titleFont;
///线条厚度
@property(nonatomic, assign)CGFloat *LienHeight;

@end
