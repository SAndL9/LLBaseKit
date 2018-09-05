//
//  LLViewController.m
//  LLBaseKit
//
//  Created by SAndL9 on 09/05/2018.
//  Copyright (c) 2018 SAndL9. All rights reserved.
//

#import "LLViewController.h"
#import "OpenFlashlightViewController.h"
//#import "LLBaseConfgurationSceneObject.h"

@interface LLViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation LLViewController




#pragma mark-
#pragma mark- View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.myTableView];
}

#pragma mark-
#pragma mark- Request


#pragma mark-
#pragma mark- SANetworkResponseProtocol

#pragma mark-
#pragma mark- UITableViewDataSource && UITableViewdelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"根据光暗打开手电筒";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        OpenFlashlightViewController *vc = [[OpenFlashlightViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
#pragma mark-
#pragma mark- <#代理类名#> delegate

#pragma mark-
#pragma mark- Event response

#pragma mark-
#pragma mark- Private Methods

#pragma mark-
#pragma mark- Getters && Setters
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
//        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.tableFooterView = [[UIView alloc]init];
        _myTableView.rowHeight = 70;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
    }
    return _myTableView;
}
#pragma mark-
#pragma mark- SetupConstraints
- (void)setupSubviewsContraints {
//    [self.view addSubview:self.myTableView];
//    self.myTableView
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
