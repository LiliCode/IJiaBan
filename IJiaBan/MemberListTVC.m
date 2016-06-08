//
//  MemberListTVC.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "MemberListTVC.h"
#import "AddMemberTVC.h"

@interface MemberListTVC ()<PassValueDelegate>
@property (strong , nonatomic) NSMutableArray *members;

@end

@implementation MemberListTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithHexValue:AppBackgroundColor alpha:1];
}




- (IBAction)addMember:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"add" sender:@{@"dataMode":@(OTDataModeAdd)}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.members = [[[OTDataManager dataManager] allMember] mutableCopy];
    return [tableView tableViewDisplayMessage:@"您当前没有组员,可以点击右上方添加按钮添加组员" ifNecessaryForRowCount:self.members.count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    OTMemberDataEntity *member = self.members[indexPath.row];
    
    cell.textLabel.text = member.name;
    cell.detailTextLabel.text = member.job;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"add" sender:@{@"dataMode":@(OTDataModeEdit), @"entity":self.members[indexPath.row]}];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        
        OTMemberDataEntity *member = self.members[indexPath.row];
        
        [[OTDataManager dataManager] removeMember:member];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}




- (void)passValue:(id)sender indentifier:(NSString *)indentifier
{
    if([indentifier isEqualToString:@"REFRESH"])
    {
        [self.tableView reloadData];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"add"])
    {
        AddMemberTVC *member = [segue destinationViewController];
        
        OTDataMode dataMode = (OTDataMode)[sender[@"dataMode"] intValue];
        if(dataMode == OTDataModeEdit)
        {
            member.memberDataEntity = sender[@"entity"];
        }
        member.dataMode = dataMode;
        member.delegate = self;
    }
}


@end



