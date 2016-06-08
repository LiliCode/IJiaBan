//
//  OTMemberDataEntity+CoreDataProperties.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "OTMemberDataEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface OTMemberDataEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *sex;
@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *job;
@property (nullable, nonatomic, retain) NSString *tel;
@property (nullable, nonatomic, retain) NSString *no;

@end

NS_ASSUME_NONNULL_END
