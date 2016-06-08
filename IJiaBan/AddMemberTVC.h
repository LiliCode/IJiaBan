//
//  AddMemberTVC.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddMemberTVC : UITableViewController

@property (assign , nonatomic) OTDataMode dataMode; //编辑 添加
@property (strong , nonatomic) OTMemberDataEntity *memberDataEntity;    //编辑时的成员对象

@property (weak , nonatomic) id<PassValueDelegate> delegate;

@end

