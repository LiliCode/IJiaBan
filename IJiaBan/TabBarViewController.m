//
//  TabBarViewController.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "TabBarViewController.h"
#import "AppDelegate.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //为每个子视图控制器添加左按钮
    for (UINavigationController *viewController in self.childViewControllers)
    {
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
        [barButtonItem setTarget:self];
        [barButtonItem setAction:@selector(open:)];
        [barButtonItem setImage:[UIImage imageNamed:@"more"]];
        [barButtonItem setStyle:UIBarButtonItemStylePlain];
        
        [viewController topViewController].navigationItem.leftBarButtonItem = barButtonItem;
    }
}

- (void)open:(UIBarButtonItem *)sender
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    if(app.drawerController.isOpen)
    {
        [app.drawerController close];
    }
    else
    {
        [app.drawerController open];
    }
}

- (NSArray *)destinationSegueIdentifier
{
    return @[@"myLog", @"personInfo", @"myMember", @"setup", @"about"];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}


@end




