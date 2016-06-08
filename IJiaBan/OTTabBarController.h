//
//  ViewBrowserController.h
//  yuanquan
//
//  Created by 圈圈科技 on 16/4/5.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OTTabBarController : UIViewController


/**
 *  子视图控制器个数
 */
- (NSUInteger)viewControllerCount;

/**
 *  视图切换完成是调用
 */
- (void)viewBrowserDidScroll:(NSInteger)index;

/**
 *  切换视图控制器
 *  @param index 下标
 */
- (void)transitionToViewControllerIndex:(NSUInteger)index;

/**
 *  获取视图控制器Segue标示
 */
- (NSArray *)destinationSegueIdentifier;

@end

