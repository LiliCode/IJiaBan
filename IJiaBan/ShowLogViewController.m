//
//  ShowLogViewController.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "ShowLogViewController.h"
#import "ShowLogCell.h"

@interface ShowLogViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *startRecordButton;
@property (weak, nonatomic) IBOutlet UILabel *footerLabel;
@property (strong , nonatomic) NSMutableArray *logs;

@end

@implementation ShowLogViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initInterface];
    
}

- (void)initInterface
{
    self.tableView.backgroundColor = [UIColor colorWithHexValue:AppBackgroundColor alpha:1];
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

- (NSMutableArray *)logs
{
    if(!_logs)
    {
        _logs = [NSMutableArray new];
    }
    
    return _logs;
}

- (IBAction)addLog:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"add" sender:nil];
}

#pragma mark - 表视图数据源

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.logs = [[[OTDataManager dataManager] allLog] mutableCopy];
    self.footerLabel.hidden = !self.logs.count;
    return [tableView tableViewDisplayMessage:@"当前还没有记录哦" ifNecessaryForRowCount:self.logs.count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00000001f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowLogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    OTLogDataEntity *log = self.logs[indexPath.row];
    cell.otDate = log.otDate;
    cell.otScale = [NSString stringWithFormat:@"%@",log.otScale];
    cell.otDuration = [NSString stringWithFormat:@"%@",log.otDuration];
    cell.otWage = [NSString stringWithFormat:@"%@",log.otWage];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    
    UITableViewRowAction *edit = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
    }];
    
    edit.backgroundColor = [UIColor colorWithHexValue:AppMainColor alpha:1];
    
    return @[delete, edit];
}

#pragma mark - 表视图代理

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
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
