//
//  YQNavigationController.m
//  yuanquan
//
//  Created by 圈圈科技 on 15/12/28.
//  Copyright (c) 2015年 圈圈科技. All rights reserved.
//

#import "OTNavigationController.h"

@interface OTNavigationController ()


@end

@implementation OTNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //配置导航条
    [self setNavigationController];
}


- (void)setNavigationController
{
    //导航条颜色 #F8C054
    [self.navigationBar setBarTintColor:[UIColor colorWithHexValue:AppMainColor alpha:1]];
    //文字颜色
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //半透明 NO
    [self.navigationBar setTranslucent:NO];
    //删除导航条底部图片
    [self.navigationBar setShadowImage:[UIImage new]];

    [self.navigationBar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    
    self.navigationController.navigationBar.clipsToBounds = YES;
}


-(void)popself:(UIBarButtonItem *)item
{
    //返回箭头
    [item setImage:[[UIImage imageNamed:AppNavigationBarBackHighlighted] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self popViewControllerAnimated:YES];
}

/**
 *  设置返回按钮 箭头
 */
- (UIBarButtonItem*)createBackButton
{
    //返回item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(popself:)];
    //返回箭头
    [backItem setImage:[[UIImage imageNamed:AppNavigationBarBackNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //箭头图片外边距
//    [backItem setImageInsets:UIEdgeInsetsMake(3, -12, 3, 12)];
    
    return backItem;
}

//重写导航控制器的pushViewController:animated: 方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //在push下一个视图控制器之前，隐藏tabBar
    viewController.hidesBottomBarWhenPushed = YES;
    //调用超类方法push
    [super pushViewController:viewController animated:animated];
    
    //如果左边没有BarButtonItem或者导航控制器的导航栈中的视图控制器大于1个才会出现返回按钮
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1)
    {
        viewController.navigationItem.leftBarButtonItem = [self createBackButton];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
