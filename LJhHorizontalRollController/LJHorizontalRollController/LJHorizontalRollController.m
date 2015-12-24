//
//  LJHorizontalRollController.m
//  LJhHorizontalRollController
//
//  Created by gaolijun on 15/8/11.
//  Copyright (c) 2015年 Lijun Gao. All rights reserved.
//

#import "LJHorizontalRollController.h"

#define TheViewWidth [UIScreen mainScreen].bounds.size.width
#define TheViewHeight [UIScreen mainScreen].bounds.size.height

@interface LJHorizontalRollController ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scroller;


@property(nonatomic,assign) int willShowNo;

@end

@implementation LJHorizontalRollController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baseViewDidAppear) name:@"LJBaseViewDidAppear" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(baseViewDidDisAppear) name:@"LJBaseViewDidDisAppear" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int number = (int)self.childViewControllers.count;
    
    UIScrollView *scroller = [[UIScrollView alloc] init];
    scroller.frame = self.view.bounds;
    scroller.contentSize = CGSizeMake(number * TheViewWidth, 0);
    scroller.bounces = NO;
    scroller.pagingEnabled = YES;
    scroller.delegate = self;
    scroller.showsHorizontalScrollIndicator = NO;
    scroller.showsVerticalScrollIndicator = NO;
    [scroller setContentOffset:CGPointMake(self.theShowNo * TheViewWidth, 0) animated:NO];
    [self.view addSubview:scroller];
    self.scroller = scroller;
    
    [self setNewController];
    
}

- (void)setNewController
{
    UINavigationController *nav = self.childViewControllers[self.theShowNo];
    nav.view.frame = CGRectMake(self.theShowNo * TheViewWidth, 0, TheViewWidth, TheViewHeight);
    [self.scroller addSubview:nav.view];
}

- (void)setupVc:(UIViewController *)vc title:(NSString *)title
{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.title = title;
    [self addChildViewController:nav];
}

#pragma mark - scrollerviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int number = (int)self.childViewControllers.count;
    
    // 左滑
    if (scrollView.contentOffset.x < self.theShowNo * TheViewWidth) {
        
        int i = (self.theShowNo * TheViewWidth - scrollView.contentOffset.x) / TheViewWidth + 1;
        
        self.willShowNo = self.theShowNo - i ;
        if (self.willShowNo < 0) {
            self.willShowNo = 0;
        }
        
        UINavigationController *nav = self.childViewControllers[self.willShowNo];
        nav.view.frame = CGRectMake(self.willShowNo * TheViewWidth, 0, TheViewWidth, TheViewHeight);
        [self.scroller addSubview:nav.view];
        
    }
    
    // 右滑
    if (scrollView.contentOffset.x > self.theShowNo * TheViewWidth) {
        
        int i = (scrollView.contentOffset.x - self.theShowNo * TheViewWidth) / TheViewWidth + 1;
        
        self.willShowNo = self.theShowNo + i ;
        if (self.willShowNo > (number - 1)) {
            self.willShowNo = (number - 1);
        }
        
        UINavigationController *nav = self.childViewControllers[self.willShowNo];
        nav.view.frame = CGRectMake(self.willShowNo * TheViewWidth, 0, TheViewWidth, TheViewHeight);
        [self.scroller addSubview:nav.view];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 计算当前显示的第几个界面
    CGFloat theX = scrollView.contentOffset.x;
    int i = theX / TheViewWidth;
    self.theShowNo = i;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGFloat theX = scrollView.contentOffset.x;
    int i = theX / TheViewWidth;
    self.theShowNo = i;
    
    for (int i = 0; i < self.childViewControllers.count; i++) {
        
        UINavigationController *nav = self.childViewControllers[i];
        if (i != self.theShowNo) {
            [nav.view removeFromSuperview];
        }
        
    }
    self.scroller.scrollEnabled = YES;
    
}

- (void)nextRight
{
    self.willShowNo = self.theShowNo + 1;
    [self.scroller setContentOffset:CGPointMake(self.willShowNo * TheViewWidth, 0) animated:YES];
}

- (void)nextLeft
{
    self.willShowNo = self.theShowNo - 1;
    [self.scroller setContentOffset:CGPointMake(self.willShowNo * TheViewWidth, 0) animated:YES];
}

#pragma mark - LJBaseViewDidDisAppear or LJBaseViewDidAppear
- (void)baseViewDidDisAppear
{
    self.scroller.scrollEnabled = NO;
}

- (void)baseViewDidAppear
{
    self.scroller.scrollEnabled = YES;
}

@end
