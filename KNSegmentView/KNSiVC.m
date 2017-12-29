//
//  KNSiVC.m
//  KNSegmentView
//
//  Created by 刘凡 on 2017/12/5.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "KNSiVC.h"
#import "Masonry.h"


@interface KNSiVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *sanTableView;

@end

@implementation KNSiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:self.sanTableView];
    [self.sanTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  50;
}



#pragma mark - 设置总共的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


#pragma mark - 设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"NextView: indexPath.Row : %ld",indexPath.row];
    return cell;
}



-(UITableView *)sanTableView{
    if (!_sanTableView) {
        _sanTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _sanTableView.delegate = self;
        _sanTableView.dataSource = self;
        _sanTableView.estimatedRowHeight = 0;
        _sanTableView.sectionHeaderHeight = 0;
        _sanTableView.sectionFooterHeight = 0;
    }
    return _sanTableView;
}


@end
