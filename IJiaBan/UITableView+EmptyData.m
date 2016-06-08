//
//  UITableView+EmptyData.m
//  表视图无数据显示
//
//  Created by 圈圈科技 on 16/5/11.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "UITableView+EmptyData.h"

#define MSG_IMAGE_SIZE  (100.0f)

@implementation UITableView (EmptyData)


- (NSInteger)tableViewDisplayMessage:(NSString *)message ifNecessaryForRowCount:(NSUInteger)rowCount
{
    if(!rowCount)
    {
        NSAssert(message && message.length, @"异常:消息不能为空!");
        //表视图没有数据则显示消息
        UILabel *msgLabel = [[UILabel alloc] init];
        msgLabel.text = message;
        msgLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        msgLabel.textColor = [UIColor lightGrayColor];
        msgLabel.textAlignment = NSTextAlignmentCenter;
        msgLabel.backgroundColor = [UIColor clearColor];
        [msgLabel sizeToFit];
        
        self.backgroundView = msgLabel;
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    else
    {
        self.backgroundView = nil;
    }
    
    return rowCount;
}

- (NSInteger)tableViewDisplayMessageImage:(UIImage *)msgImage ifNecessaryForRowCount:(NSUInteger)rowCount
{
    if(!rowCount)
    {
        NSAssert(msgImage, @"异常:图片不能为空!");
        //背景视图
        UIView *bgView = [UIView new];
        bgView.frame = self.backgroundView.bounds;
        bgView.backgroundColor = [UIColor clearColor];
        //图片
        UIImageView *msgImageView = [[UIImageView alloc] initWithImage:msgImage];
        msgImageView.bounds = CGRectMake(0, 0, MSG_IMAGE_SIZE, MSG_IMAGE_SIZE);
        msgImageView.center = bgView.center;
        [bgView addSubview:msgImageView];
        
        self.backgroundView = bgView;
    }
    else
    {
        self.backgroundView = nil;
    }
    
    return rowCount;
}

- (NSInteger)tableViewDisplayMessage:(NSString *)message messageImage:(UIImage *)msgImage ifNecessaryForRowCount:(NSUInteger)rowCount
{
    if(!rowCount)
    {
        NSAssert(msgImage && message, @"异常:消息及图片不能为空!");
        //背景视图
        UIView *bgView = [UIView new];
        bgView.frame = self.backgroundView.bounds;
        bgView.backgroundColor = [UIColor clearColor];
        //图片
        UIImageView *msgImageView = [[UIImageView alloc] initWithImage:msgImage];
        msgImageView.bounds = CGRectMake(0, 0, MSG_IMAGE_SIZE, MSG_IMAGE_SIZE);
        msgImageView.center = bgView.center;
        [bgView addSubview:msgImageView];
        //文字
        UILabel *msgLabel = [[UILabel alloc] init];
        msgLabel.text = message;
        msgLabel.numberOfLines = 0;
        msgLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        msgLabel.textColor = [UIColor lightGrayColor];
        msgLabel.textAlignment = NSTextAlignmentCenter;
        msgLabel.backgroundColor = [UIColor clearColor];
        msgLabel.center = CGPointMake(bgView.center.x, bgView.center.y + MSG_IMAGE_SIZE/2.0f + 20);
        msgLabel.bounds = CGRectMake(0, 0, bgView.bounds.size.width-16, 21);
        [msgLabel sizeToFit];
        [bgView addSubview:msgLabel];
        
        
        self.backgroundView = bgView;
    }
    else
    {
        self.backgroundView = nil;
    }
    
    return rowCount;
}

@end




