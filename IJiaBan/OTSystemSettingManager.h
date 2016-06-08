//
//  OTSystemSettingManager.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/20.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTSystemSettingEntity.h"

@interface OTSystemSettingManager : NSObject

@property (strong , nonatomic) OTSystemSettingEntity *systemSettingModel;

/**
 *  系统设置共享实例
 */
+ (instancetype)sharedInstance;

/**
 *  保存设置
 */
- (void)saveSystemSetting;


@end
