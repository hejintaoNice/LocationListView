//
//  CityListCell.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "CityListCell.h"
#import "CityModel.h"

@interface CityListCell ()

/** 城市名称 */
@property (nonatomic,strong) UILabel *cityNameLabel;
/** 选择城市图片 */
@property (nonatomic,strong) UIImageView *citySelectedImageView;

@end

@implementation CityListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.cityNameLabel];
    [self.cityNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.contentView addSubview:self.citySelectedImageView];
    [self.citySelectedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.height.equalTo(@24);
    }];
}

-(UILabel *)cityNameLabel{
    if (!_cityNameLabel) {
        _cityNameLabel = [[UILabel alloc]init];
        _cityNameLabel.textColor = RGBCOLOR(51, 51, 51);
        _cityNameLabel.font = HJTFont(14);
    }
    return _cityNameLabel;
}

-(UIImageView *)citySelectedImageView{
    if (!_citySelectedImageView) {
        _citySelectedImageView = [[UIImageView alloc]init];
        _citySelectedImageView.image = [UIImage imageNamed:@"selected"];
    }
    return _citySelectedImageView;
}

-(void)setCity:(city *)city{
    if (_city != city) {
        _city = city;
        self.cityNameLabel.text = city.name;
        self.citySelectedImageView.hidden = !city.isSelected;
    }
}



@end
