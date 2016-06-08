//
//  ViewBrowserController.m
//  yuanquan
//
//  Created by 圈圈科技 on 16/4/5.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//


#import "OTTabBarController.h"

@interface OTTabBarController ()<UIScrollViewDelegate>
@property (strong , nonatomic) UIView *container;
@property (strong , nonatomic) UIViewController *lastChildViewController;

@end

@implementation OTTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //获取目标视图控制器 并将其添加到childViewControllers中
    [self destinationViewController];
    
    self.view = self.container;
    self.lastChildViewController = [self.childViewControllers firstObject];
    self.lastChildViewController.view.frame = self.container.bounds;
    [self.container addSubview:self.lastChildViewController.view];
    //已经添加到当前控制器,通知child，完成了父子关系的建立
    [self.lastChildViewController didMoveToParentViewController:self];
}

- (UIView *)container
{
    if(!_container)
    {
        _container = [UIView new];
    }
    
    return _container;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    //屏幕旋转时适配Container的尺寸
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat nav_h = 0;
    if(self.navigationController)
    {
        nav_h = 64;
    }
    self.container.frame = CGRectMake(0, 0, size.width, size.height - nav_h - self.tabBarController.tabBar.frame.size.height);
}

/**
 *  获取视图控制器
 */
- (void)destinationViewController
{
    NSArray *segues = [self destinationSegueIdentifier];
    for (NSString *segue in segues)
    {
        [self performSegueWithIdentifier:segue sender:nil];
    }
}


- (void)viewBrowserDidScroll:(NSInteger)index
{
    //派生类中重写
    
}

/**
 *  获取视图控制器Segue标示
 */
- (NSArray *)destinationSegueIdentifier
{
    //派生类重写
    return nil;
}


- (NSUInteger)viewControllerCount
{
    return self.childViewControllers.count;
}

/**
 *  切换视图控制器
 */
- (void)transitionToViewControllerIndex:(NSUInteger)index
{
    //通知child即将接触父子关系
    [self.lastChildViewController willMoveToParentViewController:nil];
    //将child的视图移除
    [self.lastChildViewController.view removeFromSuperview];
    //获取新的child
    self.lastChildViewController = self.childViewControllers[index];
    self.lastChildViewController.view.frame = self.container.bounds;
    [self.container addSubview:self.lastChildViewController.view];
    [self.lastChildViewController didMoveToParentViewController:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc
{
    
}



@end



