//
//  CityLocationView.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "CityLocationView.h"

@interface CityLocationView ()

/** 当前定位城市 */
@property (strong, nonatomic) UILabel *cityLabel;
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *title;

@end

@implementation CityLocationView

+ (instancetype)cityLocationView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
        
    }
    return self;
}



- (void)setLocationCity:(NSString *)locationCity {
    _locationCity = locationCity;
    
    [self.cityButton setTitle:locationCity forState:UIControlStateNormal];
}


#pragma mark -- 视图
- (void)setupView {
    
    [self addSubview:self.cityLabel];
    [self addSubview:self.cityButton];
    
    [self addSubview:self.title];
    [self addSubview:self.icon];
    
    [self addSubview:self.locationButton];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor blueColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
    [self setupConstraints];
}

#pragma mark -- 约束
- (void)setupConstraints {
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.cityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cityLabel.mas_right).offset(14);
        make.width.mas_equalTo(91);
        make.height.mas_equalTo(27);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.locationButton.mas_centerY);
        make.width.height.equalTo(@16);
        make.right.equalTo(self.title.mas_left).offset(-5);
    }];
    
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_left);
        make.right.equalTo(self.title.mas_right);
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}


#pragma mark -- 懒加载
- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.text = @"当前定位城市";
        _cityLabel.font = HJTFont(12);
        _cityLabel.textColor = RGBCOLOR(0, 171, 238);
    }
    return _cityLabel;
}

- (UIButton *)cityButton {
    if (!_cityButton) {
        _cityButton = [UIButton new];
        [_cityButton setTitle:@"未知" forState:UIControlStateNormal];
        [_cityButton setTitleColor:RGBCOLOR(0, 171, 238) forState:UIControlStateNormal];
        _cityButton.titleLabel.font = HJTFont(13);
        _cityButton.layer.borderWidth = 1;
        _cityButton.layer.borderColor = RGBCOLOR(0, 171, 238).CGColor;
        _cityButton.layer.cornerRadius = 2;
        _cityButton.layer.masksToBounds = YES;
        _cityButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _cityButton;
}

- (UIButton *)locationButton {
    if (!_locationButton) {
        _locationButton = [[UIButton alloc]init];;
    }
    return _locationButton;
}

-(UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc]init];
        _icon.image = [UIImage imageNamed:@"againLocation"];
    }
    return _icon;
}

-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        _title.font = HJTFont(13);
        _title.textColor = RGBCOLOR(0, 171, 238);
        _title.text = @"重新定位";
    }
    return _title;
}

@end
