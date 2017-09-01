//
//  HotCityCell.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CityModel;

typedef void(^SelectedCityBlock)(NSString *selectedCity, NSInteger Id);

@interface HotCityCell : UITableViewCell

/** 城市模型 */
@property (strong, nonatomic) CityModel *cityModel;
/** 城市选择block */
@property (copy, nonatomic) SelectedCityBlock selectedCityBlock;

@end
