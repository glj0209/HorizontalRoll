//
//  LJOneTestViewController.m
//  LJhHorizontalRollController
//
//  Created by gaolijun on 15/8/12.
//  Copyright (c) 2015年 Lijun Gao. All rights reserved.
//

#import "LJOneTestViewController.h"
#import "LJTwoTestViewController.h"

@interface LJOneTestViewController ()

@end

@implementation LJOneTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:self.navigationController.title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(popTheTwoTestController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"mbdsgsl;dgs;dkg");
}

- (void)popTheTwoTestController:(UIButton *)button
{
    LJTwoTestViewController *two = [[LJTwoTestViewController alloc] init];
    two.view.backgroundColor = [UIColor greenColor];
    two.title = @"two";
    [self.navigationController pushViewController:two animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
