//
//  MenuViewController.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"
#import "AppDelegate.h"

@interface MenuViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (strong , nonatomic) NSArray *menuItems;
@property (assign , nonatomic) NSUInteger viewControllerIndex;  //当前的视图控制器索引

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置背景
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithR:40.0f G:40.0f B:40.0f alpha:1];
    view.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.backgroundView = view;
    
    //logo
    self.logoImageView.layer.masksToBounds = YES;
    self.logoImageView.layer.cornerRadius = 50.0f;
    self.logoImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.logoImageView.layer.borderWidth = 2;
}

- (NSArray *)menuItems
{
    if(!_menuItems)
    {
        _menuItems = @[@"我的记录", @"个人信息", @"我的组员", @"系统设置", @"关于记录"];
    }
    
    return _menuItems;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.itemName = self.menuItems[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //切换控制器
    if(self.viewControllerIndex != indexPath.row)
    {
        [self.tabBarController transitionToViewControllerIndex:indexPath.row];
        self.viewControllerIndex = indexPath.row;   //设置当前索引
    }
    
    //关闭抽屉
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app.drawerController close];   //关闭抽屉
}


#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
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




