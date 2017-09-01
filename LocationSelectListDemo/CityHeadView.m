//
//  CityHeadView.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "CityHeadView.h"

@implementation CityHeadView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = RGBCOLOR(235, 235, 235);
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = RGBCOLOR(51, 51, 51);
        _titleLabel.font = HJTFont(14);
    }
    return _titleLabel;
}

@end
