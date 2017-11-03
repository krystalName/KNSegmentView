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
 创建的类方法

 @param frame 创建位置
 @param TitleArray 选择标题数组
 @param defalutColor 默认字体颜色
 @param selectColor 选中字体颜色
 @param font 字体Font
 @param delegate 代理
 @return 返回自己
 */
+(KNSegmentView *)SetKNSegmentViewFrame:(CGRect)frame titletData:(NSArray <NSString *> *)TitleArray defalutColor:(UIColor *)defalutColor selectColor:(UIColor *)selectColor titleFont:(UIFont *)font
                             Delegate:(id)delegate;


///底部线条View
@property(nonatomic, strong)UIColor *downLienColor;

///线条厚度
@property(nonatomic, assign)CGFloat LienHeight;

@end
