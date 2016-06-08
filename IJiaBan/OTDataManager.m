//
//  OTDataManager.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "OTDataManager.h"
#import "AppDelegate.h"

#define OTLogDataEntityName    @"OTLogDataEntity"
#define OTMemberDataEntityName @"OTMemberDataEntity"

@interface OTDataManager()
@property (strong , nonatomic) AppDelegate *appDelegate;

@end

@implementation OTDataManager



- (AppDelegate *)appDelegate
{
    if(!_appDelegate)
    {
        _appDelegate = [UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

/**
 *  初始化
 */
+ (instancetype)dataManager
{
    return [[[self class] alloc] init];
}

/**
 *  记录 添加数据
 * @param log 需要添加的记录数据
 */
- (void)addLog:(NSDictionary *)info
{
    //新建一个视图
    OTLogDataEntity *logData = [NSEntityDescription insertNewObjectForEntityForName:OTLogDataEntityName inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSArray *allKeys = [info allKeys];
    for (NSString *key in allKeys)
    {
        [logData setValue:info[key] forKey:key];
    }
    
    [self.appDelegate saveContext];
}

/**
 *  记录 删除数据
 *  @param log 需要删除的数据
 */
- (void)removeLog:(OTLogDataEntity *)log
{
    [self.appDelegate.managedObjectContext deleteObject:log];
    [self.appDelegate saveContext];
}

/**
 *  记录 修改数据
 * @param log 需要修改的实体
 * @param info 需要修改的数据
 */
- (void)updateLog:(OTLogDataEntity *)log info:(NSDictionary *)info
{
    NSArray *allKeys = [info allKeys];
    for (NSString *key in allKeys)
    {
        [log setValue:info[key] forKey:key];
    }
    
    [self.appDelegate saveContext];
}

/**
 *  查找数据
 */
- (NSArray <OTLogDataEntity *>*)allLog
{
    return [self find:OTLogDataEntityName];
}

/**
 *  查找数据
 */
- (NSArray *)find:(NSString *)entityName
{
    //创建查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    //查询
    return [self.appDelegate.managedObjectContext executeFetchRequest:request error:nil];
}


/**
 *  成员 添加数据
 * @param info 需要添加的记录数据
 */
- (void)addMember:(NSDictionary *)info
{
    //新建一个视图
    OTMemberDataEntity *memberData = [NSEntityDescription insertNewObjectForEntityForName:OTMemberDataEntityName inManagedObjectContext:self.appDelegate.managedObjectContext];
    NSArray *allKeys = [info allKeys];
    for (NSString *key in allKeys)
    {
        [memberData setValue:info[key] forKey:key];
    }
    
    [self.appDelegate saveContext];
}

/**
 *  成员 删除数据
 *  @param member 需要删除的实体
 */
- (void)removeMember:(OTMemberDataEntity *)member
{
    NSAssert(member, @"删除的成员不能为空!");
    [self.appDelegate.managedObjectContext deleteObject:member];
    [self.appDelegate saveContext];
}

/**
 *  成员 修改数据
 * @param member 需要修改的实体
 * @param info 需要修改的数据
 */
- (void)updateMember:(OTMemberDataEntity *)member info:(NSDictionary *)info
{
    NSAssert(member, @"编辑的成员不能为空!");
    NSArray *allKeys = [info allKeys];
    for (NSString *key in allKeys)
    {
        [member setValue:info[key] forKey:key];
    }
    
    [self.appDelegate saveContext];
}

/**
 *  成员 全部成员
 */
- (NSArray <OTMemberDataEntity *>*)allMember
{
    return [self find:OTMemberDataEntityName];
}



@end



