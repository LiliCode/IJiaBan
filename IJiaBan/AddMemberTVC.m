//
//  AddMemberTVC.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "AddMemberTVC.h"

@interface AddMemberTVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTextField;
@property (weak, nonatomic) IBOutlet UITextField *noTextField;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (assign , nonatomic) BOOL canEdit;    //是否能编辑

@end

@implementation AddMemberTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithHexValue:AppBackgroundColor alpha:1];
    self.tableView.separatorInset = UIEdgeInsetsZero;
    
    if(self.dataMode == OTDataModeEdit)
    {
        [self fillout];
    }
    else
    {
        self.canEdit = YES;
        [self.navigationItem.rightBarButtonItem setTitle:@"保存"];
        [self.navigationItem.rightBarButtonItem setTarget:self];
        [self.navigationItem.rightBarButtonItem setAction:@selector(save:)];
    }
}


- (void)fillout
{
    //填写数据
    self.nameTextField.text = self.memberDataEntity.name;
    self.sexTextField.text = self.memberDataEntity.sex;
    self.ageTextField.text = [NSString stringWithFormat:@"%@", self.memberDataEntity.age];
    self.jobTextField.text = self.memberDataEntity.job;
    self.noTextField.text = self.memberDataEntity.no;
    self.telTextField.text = self.memberDataEntity.tel;
    //置空placeholder
    self.nameTextField.placeholder = nil;
    self.sexTextField.placeholder = nil;
    self.ageTextField.placeholder = nil;
    self.jobTextField.placeholder = nil;
    self.noTextField.placeholder = nil;
    self.telTextField.placeholder = nil;
    //不能交互
    self.nameTextField.enabled = NO;
    self.ageTextField.enabled = NO;
    self.jobTextField.enabled = NO;
    self.noTextField.enabled = NO;
    self.telTextField.enabled = NO;
    //编辑的时候 把保存按钮标题设置成 编辑
    [self.navigationItem.rightBarButtonItem setTitle:@"编辑"];
    [self.navigationItem.rightBarButtonItem setTarget:self];
    [self.navigationItem.rightBarButtonItem setAction:@selector(startEdit:)];
}

- (void)startEdit:(UIBarButtonItem *)sender
{
    //能编辑
    self.canEdit = YES;
    //置空placeholder
    self.nameTextField.placeholder = @"请输入对方姓名";
    self.sexTextField.placeholder = @"请选择对方性别";
    self.ageTextField.placeholder = @"请输入对方年龄";
    self.jobTextField.placeholder = @"请输入对方工作职位";
    self.noTextField.placeholder = @"请输入对方工号";
    self.telTextField.placeholder = @"请输入对方电话号码";
    //不能交互
    self.nameTextField.enabled = YES;
    self.ageTextField.enabled = YES;
    self.jobTextField.enabled = YES;
    self.noTextField.enabled = YES;
    self.telTextField.enabled = YES;
    //把编辑按钮标题设置成 保存
    [self.navigationItem.rightBarButtonItem setTitle:@"保存"];
    [self.navigationItem.rightBarButtonItem setTarget:self];
    [self.navigationItem.rightBarButtonItem setAction:@selector(save:)];
    //编辑姓名获得第一相应者
    [self.nameTextField becomeFirstResponder];
}

#pragma mark - text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(1 == indexPath.row && self.canEdit)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请选择性别" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *man = [UIAlertAction actionWithTitle:@"♂男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexTextField.text = @"男";
        }];
        UIAlertAction *girl = [UIAlertAction actionWithTitle:@"♀女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.sexTextField.text = @"女";
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:man];
        [alert addAction:girl];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (BOOL)filloutName
{
    return self.nameTextField.text && self.nameTextField.text.length;
}

- (BOOL)filloutSex
{
    return self.sexTextField.text && self.sexTextField.text.length;
}

- (BOOL)filloutJob
{
    return self.jobTextField.text && self.jobTextField.text.length;
}

- (BOOL)filloutNo
{
    return self.noTextField.text && self.noTextField.text.length;
}



- (void)save:(UIBarButtonItem *)sender
{
    if([self filloutName] && [self filloutSex] && [self filloutJob] && [self filloutNo])
    {
        NSMutableDictionary *info = [NSMutableDictionary new];
        [info setObject:self.nameTextField.text?:@"" forKey:@"name"];
        [info setObject:self.sexTextField.text?:@"" forKey:@"sex"];
        [info setObject:@([self.ageTextField.text intValue]) forKey:@"age"];
        [info setObject:self.jobTextField.text?:@"" forKey:@"job"];
        [info setObject:self.noTextField.text?:@"" forKey:@"no"];
        [info setObject:self.telTextField.text?:@"" forKey:@"tel"];
        
        switch (self.dataMode)
        {
            case OTDataModeAdd: [[OTDataManager dataManager] addMember:[info copy]]; break;
                
            case OTDataModeEdit: [[OTDataManager dataManager] updateMember:self.memberDataEntity info:[info copy]]; break;
                
            default: break;
        }
        
        if([self.delegate respondsToSelector:@selector(passValue:indentifier:)])
        {
            [self.delegate passValue:nil indentifier:@"REFRESH"];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
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





