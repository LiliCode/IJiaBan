//
//  OTSystemSettingManager.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/20.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "OTSystemSettingManager.h"
#import "AppDelegate.h"

#define OTSystemSettingEntityName @"OTSystemSettingEntity"

@interface OTSystemSettingManager()
@property (strong , nonatomic) AppDelegate *appDelegate;

@end

@implementation OTSystemSettingManager

- (AppDelegate *)appDelegate
{
    if(!_appDelegate)
    {
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

+ (instancetype)sharedInstance
{
    static OTSystemSettingManager *systemSetting = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        systemSetting = [[[self class] alloc] init];
        //获取数据模型
        systemSetting.systemSettingModel = [systemSetting getSystemSettingModel];
    });
    
    return systemSetting;
}


/**
 *  获取系统设置模型 systemSettingModel
 */
- (OTSystemSettingEntity *)getSystemSettingModel
{
    //查询数据
    NSArray *list = [self.appDelegate find:OTSystemSettingEntityName error:nil];
    if(!list.count)
    {
        //若查询结果为空，就再创建
        OTSystemSettingEntity *systemSettingEntity = [NSEntityDescription insertNewObjectForEntityForName:OTSystemSettingEntityName inManagedObjectContext:self.appDelegate.managedObjectContext];
        //设置默认值
        systemSettingEntity.baseWage = @2000;
        systemSettingEntity.normalManHour = @8;
        systemSettingEntity.workDay = @22;
        systemSettingEntity.scale = @1.5;
        systemSettingEntity.displayLogMode = @0;
        
        [self.appDelegate saveContext];
        
        return systemSettingEntity;
    }
    
    return [list firstObject];  //若查询成功，则返回数据模型
}


/**
 *  保存设置
 */
- (void)saveSystemSetting
{
    [self.appDelegate saveContext];
}


@end





