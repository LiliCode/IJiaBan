//
//  OTDataManager.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTLogDataEntity.h"
#import "OTMemberDataEntity.h"

@interface OTDataManager : NSObject

/**
 *  初始化
 */
+ (instancetype)dataManager;

/**
 *  记录 添加数据
 * @param info 需要添加的记录数据
 */
- (void)addLog:(NSDictionary *)info;

/**
 *  记录 删除数据
 *  @param log 需要删除的实体
 */
- (void)removeLog:(OTLogDataEntity *)log;

/**
 *  记录 修改数据
 * @param log 需要修改的实体
 * @param info 需要修改的数据
 */
- (void)updateLog:(OTLogDataEntity *)log info:(NSDictionary *)info;

/**
 *  记录 全部记录
 */
- (NSArray <OTLogDataEntity *>*)allLog;



/**
 *  成员 添加数据
 * @param info 需要添加的记录数据
 */
- (void)addMember:(NSDictionary *)info;

/**
 *  成员 删除数据
 *  @param log 需要删除的实体
 */
- (void)removeMember:(OTMemberDataEntity *)member;

/**
 *  成员 修改数据
 * @param log 需要修改的实体
 * @param info 需要修改的数据
 */
- (void)updateMember:(OTMemberDataEntity *)member info:(NSDictionary *)info;

/**
 *  成员 全部成员
 */
- (NSArray <OTMemberDataEntity *>*)allMember;



@end




