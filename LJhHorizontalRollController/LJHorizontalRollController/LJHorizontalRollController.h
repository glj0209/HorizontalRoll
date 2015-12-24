//
//  LJHorizontalRollController.h
//  LJhHorizontalRollController
//
//  Created by gaolijun on 15/8/11.
//  Copyright (c) 2015年 Lijun Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LJHorizontalRollControllerDelegate <NSObject>

@optional


@end

@interface LJHorizontalRollController : UIViewController

@property(nonatomic,weak) id<LJHorizontalRollControllerDelegate> delegate;

@property(nonatomic,assign) int theShowNo;

- (void)setupVc:(UIViewController *)vc title:(NSString *)title;

- (void)nextRight;

- (void)nextLeft;

@end
