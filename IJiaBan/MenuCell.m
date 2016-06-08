//
//  MenuCell.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/13.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "MenuCell.h"

@interface MenuCell()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation MenuCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

- (void)setItemName:(NSString *)itemName
{
    _itemName = itemName;
    self.label.text = itemName;
}



@end
