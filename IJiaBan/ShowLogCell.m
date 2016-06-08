//
//  ShowLogCell.m
//  IJiaBan
//
//  Created by 圈圈科技 on 16/5/18.
//  Copyright © 2016年 圈圈科技. All rights reserved.
//

#import "ShowLogCell.h"

@interface ShowLogCell()
@property (weak, nonatomic) IBOutlet UILabel *otDataLabel;
@property (weak, nonatomic) IBOutlet UILabel *otScaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *otTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *otWageLabel;

@end

@implementation ShowLogCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

- (void)setOtDate:(NSString *)otDate
{
    _otDate = otDate;
    self.otDataLabel.text = otDate;
}

- (void)setOtScale:(NSString *)otScale
{
    _otScale = otScale;
    self.otScaleLabel.text = otScale;
}

- (void)setOtDuration:(NSString *)otDuration
{
    _otDuration = otDuration;
    self.otTimeLabel.text = otDuration;
}

- (void)setOtWage:(NSString *)otWage
{
    _otWage = otWage;
    self.otWageLabel.text = otWage;
}



@end



