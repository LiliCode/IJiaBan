//
//  OTLogDataEntity+CoreDataProperties.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OTLogDataEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTLogDataEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *otScale;
@property (nullable, nonatomic, retain) NSNumber *otDuration;
@property (nullable, nonatomic, retain) NSString *otDate;
@property (nullable, nonatomic, retain) NSString *updateTime;
@property (nullable, nonatomic, retain) NSString *otMembers;
@property (nullable, nonatomic, retain) NSNumber *otWage;

@end

NS_ASSUME_NONNULL_END
