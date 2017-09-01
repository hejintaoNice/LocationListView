//
//  CityModel.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list": [cityList class], @"hotCity" : [city class]};
}

@end


@implementation cityList

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"citys": [city class]};
}

@end


@implementation city

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{@"Id": @"id"};
}




@end
