//
//  SystemSettingTVC.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/19.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "SystemSettingTVC.h"

@interface SystemSettingTVC ()
@property (weak, nonatomic) IBOutlet UILabel *baseWageLabel;
@property (weak, nonatomic) IBOutlet UILabel *workDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *man_hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *scaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *logDispalyModeLabel;
@property (strong , nonatomic) OTSystemSettingManager *systemSetting;

@end

@implementation SystemSettingTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.systemSetting = [OTSystemSettingManager sharedInstance];
    self.tableView.backgroundColor = [UIColor colorWithHexValue:AppBackgroundColor alpha:1];
    self.baseWageLabel.text = [[self stringWithNumber:self.systemSetting.systemSettingModel.baseWage] stringByAppendingString:@"元"];
    self.workDayLabel.text = [[self stringWithNumber:self.systemSetting.systemSettingModel.workDay] stringByAppendingString:@"天"];
    self.man_hourLabel.text = [[self stringWithNumber:self.systemSetting.systemSettingModel.normalManHour] stringByAppendingString:@"小时"];
    self.scaleLabel.text = [[self stringWithNumber:self.systemSetting.systemSettingModel.scale] stringByAppendingString:@"倍"];
    if([self.systemSetting.systemSettingModel.displayLogMode integerValue])
    {
        self.logDispalyModeLabel.text = @"全部显示";
    }
    else
    {
        self.logDispalyModeLabel.text = @"显示当月记录";
    }
}

- (NSString *)stringWithNumber:(NSNumber *)number
{
    return [NSString stringWithFormat:@"%@",number];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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




