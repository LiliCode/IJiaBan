//
//  Config.m
//  IJiaBan
//
//  Created by 李立 on 16/6/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "Config.h"

bool xrl(bool a, bool b)
{
    return (!a && b) || (a && !b);
}

bool xnor(bool a, bool b)
{
    return !xrl(a, b);
}

