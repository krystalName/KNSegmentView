//
//  KNSegmentView.m
//  KNSegmentView
//
//  Created by 刘凡 on 2017/11/3.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNSegmentView.h"


@interface KNSegmentView()

///宽度
@property(nonatomic, assign)CGFloat widhtFloat;

///指示线条
@property(nonatomic, strong)UIView *bottonDownView;

///当前下表
@property(nonatomic, assign)NSInteger selectSeugment;

///按钮数组
@property(nonatomic, strong)NSMutableArray *buttonSource;


@end


@implementation KNSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化数组
        self.buttonSource = [[NSMutableArray alloc]init];
        //设置默认值
        _selectSeugment = 0;
        self.bakeGroundColor = [UIColor lightGrayColor];
        self.backgroundColor = self.bakeGroundColor;
        self.downLienColor = [UIColor redColor];
        self.LienHeight = 2.f;
        
    }
    return self;
}


+(KNSegmentView *)SetKNSegmentViewFrame:(CGRect)frame titletData:(NSArray<NSString *> *)TitleArray defalutColor:(UIColor *)defalutColor selectColor:(UIColor *)selectColor titleFont:(UIFont *)font Delegate:(id)delegate
{
    KNSegmentView *segmentView = [[self alloc] initWithFrame:frame];
    segmentView.titleFont = font;
    segmentView.selectColor = selectColor;
    segmentView.defaultColor = defalutColor;
    segmentView.delegate = delegate;
    
    [segmentView AddSeguentWithArray:TitleArray];
    
    return segmentView;
}

-(void)AddSeguentWithArray:(NSArray <NSString *> *)SegumentArray{
    
    //设置宽度
    _widhtFloat = (self.bounds.size.width) / SegumentArray.count;
    
    for (int i = 0; i<SegumentArray.count; i++) {

        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i *_widhtFloat, 0, _widhtFloat, self.bounds.size.height - self.LienHeight)];
        [btn setTitle:SegumentArray[i] forState:UIControlStateNormal];
        btn.titleLabel.font = self.titleFont;
        [btn setTitleColor:self.defaultColor forState:UIControlStateNormal];
        [btn setTitleColor:self.selectColor forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(ChangeBtnTag:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            _bottonDownView = [[UIView alloc]initWithFrame:CGRectMake(i *_widhtFloat, self.bounds.size.height - self.LienHeight, _widhtFloat, self.LienHeight)];
            _bottonDownView.backgroundColor = _downLienColor;
            [self addSubview:_bottonDownView];
        }
        [self addSubview:btn];
        
        [self.buttonSource addObject:btn];
        
    }
    
    [[self.buttonSource firstObject] setSelected:YES];
}

//按钮点击事件
-(void)ChangeBtnTag:(UIButton *)sender{
    
    [self selectTheSegument:sender.tag];
    
}

-(void)selectTheSegument:(NSInteger)segument{
    
    if (_selectSeugment != segument) {
        
        [self.buttonSource[_selectSeugment] setSelected:NO];
        [self.buttonSource[segument] setSelected:YES];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            [_bottonDownView setFrame:CGRectMake(segument * _widhtFloat,self.bounds.size.height - self.LienHeight, _widhtFloat, self.LienHeight)];
        }];
        _selectSeugment = segument;
        [self.delegate KNSegmentSelectionChange:_selectSeugment];
    }
}


-(void)setBakeGroundColor:(UIColor *)bakeGroundColor
{
    if (_bakeGroundColor != bakeGroundColor) {
        _bakeGroundColor = bakeGroundColor;
        self.backgroundColor = _bakeGroundColor;
    }
}
-(void)setDownLienColor:(UIColor *)downLienColor
{
    if (_downLienColor != downLienColor) {
        _downLienColor = downLienColor;
        self.bottonDownView.backgroundColor = _downLienColor;
    }
}

-(void)setLienHeight:(CGFloat)LienHeight
{
    if (_LienHeight != LienHeight) {
        _LienHeight  = LienHeight;
        CGRect frame =  _bottonDownView.frame;
        frame.size.height = _LienHeight;
        _bottonDownView.frame = frame;
    }
}
@end
