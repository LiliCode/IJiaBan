//
//  MenuViewController.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import "OTTabBarController.h"

@interface MenuViewController : UIViewController<ICSDrawerControllerChild, ICSDrawerControllerPresenting>

@property (weak , nonatomic) OTTabBarController *tabBarController;

@end
