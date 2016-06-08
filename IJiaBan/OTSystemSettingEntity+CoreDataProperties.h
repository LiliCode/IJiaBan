//
//  OTSystemSettingEntity+CoreDataProperties.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/20.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OTSystemSettingEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTSystemSettingEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *baseWage;         //基本工资
@property (nullable, nonatomic, retain) NSNumber *normalManHour;    //正常工作时 每天正常上班时间
@property (nullable, nonatomic, retain) NSNumber *workDay;          //每个月工作日
@property (nullable, nonatomic, retain) NSNumber *scale;            //倍率
@property (nullable, nonatomic, retain) NSNumber *displayLogMode;   //显示模式，显示当月或全部

@end

NS_ASSUME_NONNULL_END
