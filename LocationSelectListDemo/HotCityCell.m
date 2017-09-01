//
//  HotCityCell.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "HotCityCell.h"
#import "CityModel.h"

#define kMargin 13
#define kButtonWidth 91
#define kGap (SCREEN_WIDTH - kButtonWidth * 3 - kMargin - 25) / 2
#define kButtonHeight 27
#define kGapH 9
#define kTopMargin 34

@interface HotCityCell ()

@property (nonatomic,strong) UILabel *titleLbl;

@property (nonatomic,strong) UIView *backView;

@end

@implementation HotCityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(30);
    }];
    [self.backView addSubview:self.titleLbl];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView.mas_top).offset(10);
        make.left.equalTo(self.backView.mas_left).offset(10);
    }];
}

-(UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc]init];
        _titleLbl.textColor = RGBCOLOR(188, 188, 188);
        _titleLbl.font = HJTFont(12);
        _titleLbl.text = @"热门城市";
    }
    return _titleLbl;
}

-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

-(void)setCityModel:(CityModel *)cityModel{
    if (_cityModel != cityModel) {
        _cityModel = cityModel;
        [self setupView];
    }
}

#define kButtonColor RGBCOLOR(0, 171, 238)

- (void)setupView {
    
    NSInteger count = 0;
    CGFloat y = 0.0;
    NSInteger x = 1;
    
    for (int i = 1; i <= self.cityModel.hotCity.count; i++) {
        
        city *city = self.cityModel.hotCity[i - 1];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.layer.cornerRadius = 2;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:13.0];
        [button setTitle:city.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        button.tag = i;
        if ([city.name isEqualToString:self.cityModel.selectedCity]) {
            [button setTitleColor:kButtonColor forState:UIControlStateNormal];
            button.layer.borderColor = kButtonColor.CGColor;
        }
        
        
        if (self.cityModel.hotCity.count > count ) {
            
            if (((SCREEN_WIDTH) - (kMargin + kButtonWidth * (x - 1) + kGap * (x - 1))) <= kButtonWidth) {
                y += kGapH + kButtonHeight;
                x = 1;
            }
            
            button.frame = CGRectMake(kMargin + ((kButtonWidth + kGap) * (x - 1)), kTopMargin + y, kButtonWidth, kButtonHeight);
            count ++;
            x ++;
        }
        [button addTarget:self action:@selector(citySelected:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.backView addSubview:button];
        
        self.cityModel.hotCellH = y + kButtonHeight + kTopMargin + 11;
        
    }
    
    
}

- (void)citySelected:(UIButton *)button {
    city *city = self.cityModel.hotCity[button.tag - 1];
    
    if (self.selectedCityBlock) {
        self.selectedCityBlock(city.name, city.Id);
    }
    
}

@end
