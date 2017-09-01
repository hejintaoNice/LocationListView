//
//  CityListViewController.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityModel.h"

@protocol CityListViewControllerDelegate <NSObject>

- (void)cityListSelectedCity:(NSString *)selectedCity Id:(NSInteger)Id;

@end

@interface CityListViewController : UIViewController

/** 城市model */
@property (strong, nonatomic) CityModel *cityModel;

/** 代理 */
@property (weak, nonatomic) id<CityListViewControllerDelegate> delegate;

@end
