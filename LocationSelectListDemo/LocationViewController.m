//
//  ViewController.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "LocationViewController.h"
#import "CityListViewController.h"
@interface LocationViewController ()<CityListViewControllerDelegate>

@property (nonatomic,strong) UILabel *cityLable;
/** 选中城市Id */
@property (assign, nonatomic) NSInteger Id;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

-(void)configUI{
    [self.view addSubview:self.cityLable];
    [self.cityLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

-(UILabel *)cityLable{
    if (!_cityLable) {
        _cityLable = [[UILabel alloc]init];
        _cityLable.textColor = RGBCOLOR(51, 51, 51);
        _cityLable.font = HJTFont(30);
        _cityLable.text = @"点我试试";
    }
    return _cityLable;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CityListViewController *cityListVC = [CityListViewController new];
    
    cityListVC.delegate = self;
    cityListVC.cityModel.selectedCity = self.cityLable.text;
    cityListVC.cityModel.selectedCityId = self.Id;
    
    [self.navigationController pushViewController:cityListVC animated:YES];
    
}

- (void)cityListSelectedCity:(NSString *)selectedCity Id:(NSInteger)Id {
    
    self.cityLable.text = selectedCity;
    self.Id = Id;
    
}


@end
