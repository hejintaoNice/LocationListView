//
//  CityModel.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <Foundation/Foundation.h>
@class cityList;
@class city;


@interface CityModel : NSObject

/** 热门城市 */
@property (strong, nonatomic) NSArray<city *> *hotCity;
/** 城市列表 */
@property (strong, nonatomic) NSArray<cityList *> *list;

/** 选中城市 */
@property (strong, nonatomic) NSString *selectedCity;

/** 选中城市ID */
@property (assign, nonatomic) NSInteger selectedCityId;

/** 高度 */
@property (assign, nonatomic) CGFloat hotCellH;

@end


@interface cityList : NSObject

/** 城市数组 */
@property (strong, nonatomic) NSArray<city *> *citys;

/** 首字母 */
@property (strong, nonatomic) NSString *initial;

@end

@interface city : NSObject

/** 城市 */
@property (strong, nonatomic) NSString *name;
/** ID */
@property (assign, nonatomic) NSInteger Id;

/** 是否被选中 */
@property (assign, nonatomic, getter=isSelected) BOOL selected;

@end
