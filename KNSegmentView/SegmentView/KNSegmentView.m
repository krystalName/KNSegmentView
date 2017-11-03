//
//  KNSegmentView.m
//  KNSegmentView
//
//  Created by 刘凡 on 2017/11/3.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNSegmentView.h"

@implementation KNSegmentView





-(void)setSelectColor:(UIColor *)selectColor
{
    if (_selectColor != selectColor) {
        _selectColor = selectColor;
        
    }
}

-(void)setTitleFont:(UIFont *)titleFont{
    if (_titleFont != titleFont) {
        _titleFont = titleFont;
    }
}

-(void)setDefaultColor:(UIColor *)defaultColor{
    if (_defaultColor != defaultColor) {
        _defaultColor = defaultColor;
    }
}

-(void)setBakeGroundColor:(UIColor *)bakeGroundColor
{
    if (_bakeGroundColor != bakeGroundColor) {
        _bakeGroundColor = bakeGroundColor;
        

    }
}

@end
