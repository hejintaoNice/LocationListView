//
//  CityLocationView.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityLocationView : UIView

+ (instancetype)cityLocationView;

/** 定位城市 */
@property (strong, nonatomic) UIButton *cityButton;
/** 重新定位按钮 */
@property (strong, nonatomic) UIButton *locationButton;

/** 定位城市 */
@property (strong, nonatomic) NSString *locationCity;

@end
