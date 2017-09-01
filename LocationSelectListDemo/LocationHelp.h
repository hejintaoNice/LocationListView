//
//  LocationHelp.h
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationPlacemark)(CLPlacemark *placemark);
typedef void(^LocationFailed)(NSError *error);
typedef void(^LocationStatus)(CLAuthorizationStatus status);

@interface LocationHelp : NSObject

+ (instancetype)sharedInstance;

- (void)getLocationPlacemark:(LocationPlacemark)placemark status:(LocationStatus)status didFailWithError:(LocationFailed)error;

@end
