//
//  UITableView+EmptyData.h
//  表视图无数据显示
//
//  Created by 圈圈科技 on 16/5/11.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)

/**
 *  表视图没有数据时，显示无数据消息
 *  @param message:显示的消息
 *  @param rowCount:表视图数据计数，rowCount == 0时则显示该消息
 *  @return 返回NSInteger类型的行数
 */
- (NSInteger)tableViewDisplayMessage:(NSString *)message ifNecessaryForRowCount:(NSUInteger)rowCount;

/**
 *  表视图没有数据时，显示无数据图片
 *  @param messageImage:显示的图片
 *  @param rowCount:表视图数据计数，rowCount == 0时则显示该消息
 *  @return 返回NSInteger类型的行数
 */
- (NSInteger)tableViewDisplayMessageImage:(UIImage *)msgImage ifNecessaryForRowCount:(NSUInteger)rowCount;

/**
 *  表视图没有数据时，显示无数据消息或者图片
 *  @param message:显示的消息
 *  @param messageImage:消息图片
 *  @param rowCount:表视图数据计数，rowCount == 0时则显示该消息
 *  @return 返回NSInteger类型的行数
 */
- (NSInteger)tableViewDisplayMessage:(NSString *)message messageImage:(UIImage *)msgImage ifNecessaryForRowCount:(NSUInteger)rowCount;

@end



