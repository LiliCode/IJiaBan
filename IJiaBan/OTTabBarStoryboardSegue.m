//
//  SegmentStoryboardSegue.m
//  yuanquan
//
//  Created by 圈圈科技 on 16/4/5.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "OTTabBarStoryboardSegue.h"
#import "OTTabBarController.h"

@implementation OTTabBarStoryboardSegue

- (void)perform
{
    //得到源视图控制器
    OTTabBarController *sourceViewController = (OTTabBarController *)self.sourceViewController;
    //得到目标视图控制器
    UIViewController *destinationViewController = self.destinationViewController;
    
    //添加控制器的视图
    [sourceViewController addChildViewController:destinationViewController];
}



@end
