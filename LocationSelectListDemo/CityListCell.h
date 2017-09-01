//
//  CityListCell.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <UIKit/UIKit.h>
@class city;
@class cityList;

@interface CityListCell : UITableViewCell

/** model */
@property (strong, nonatomic) city *city;

@end
