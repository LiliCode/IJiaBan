//
//  PassValueDelegate.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/19.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueDelegate <NSObject>

/**
 *  传值协议
 *  @param indentifier 页面标示
 *  @param sender 传值
 */
- (void)passValue:(id)sender indentifier:(NSString *)indentifier;

@end
