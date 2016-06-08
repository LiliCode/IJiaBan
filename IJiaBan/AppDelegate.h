//
//  AppDelegate.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICSDrawerController.h"
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong , nonatomic) ICSDrawerController *drawerController;   //侧滑控制器

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

/**
 *  查询数据
 *  @param entityName 实体名
 *  @param error 错误详情 二级指针
 */
- (NSArray *)find:(NSString *)entityName error:(NSError **)error;

@end

