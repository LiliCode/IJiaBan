//
//  Config.h
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#ifndef __CONFIG_H__
#define __CONFIG_H__

#import <Foundation/Foundation.h>

/**
 *  添加/编辑枚举
 */
typedef NS_ENUM(NSInteger, OTDataMode)
{
    OTDataModeAdd, //添加
    OTDataModeEdit //编辑
};


//#define AppMainColor @"#20CF61" //全局主色调
#define AppMainColor @"#44B242" //全局主色调

#define AppNavigationBarBackNormal      @"navigationLeftBack_normal"        //导航栏返回按钮正常
#define AppNavigationBarBackHighlighted @"navigationLeftBack_highlighted"   //导航栏返回按钮高亮

#define MenuBackgroundImage @"MenuBackgroundImage"  //侧滑菜单背景图

#define AppBackgroundColor  @"#F3F6F7" //全局背景色

#endif //__CONFIG_H__
