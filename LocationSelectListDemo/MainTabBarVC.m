//
//  MainTabBarVC.m
//  LocationSelectListDemo
//
//  Created by 何锦涛 on 2017/8/31.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "MainTabBarVC.h"
#import "HJTNavgationController.h"
#import "LocationViewController.h"

#define ClassKey   @"rootVCClassString"
#define TitleKey   @"title"
#define ImgKey     @"imageName"
#define SelImgKey  @"selectedImageName"

@interface MainTabBarVC ()

@property (nonatomic, strong) UIViewController *vc;

@end

@implementation MainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;
    self.tabBar.barTintColor = RGBCOLOR(0, 171, 238);
    [self setUpChildVC];
}

-(void)setUpChildVC{
    
    NSArray *childItemsArray = @[
                                 @{ClassKey  : @"LocationViewController",
                                   TitleKey  : @"首页",
                                   ImgKey    : @"ic_tab bar_home_no",
                                   SelImgKey : @"ic_tab bar_home_no"}
                                 ];
    
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:13.0];
    UIColor *color_act = [UIColor whiteColor];
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        
        self.vc = [[NSClassFromString(dict[ClassKey]) alloc]init];
        self.vc.title = dict[TitleKey];
        HJTNavgationController *nav = [[HJTNavgationController alloc] initWithRootViewController:self.vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[TitleKey];
        item.image = [[UIImage imageNamed:dict[ImgKey]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:dict[SelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : color_act,NSFontAttributeName:font} forState:UIControlStateSelected];
        [item setTitleTextAttributes:@{NSFontAttributeName:font} forState:UIControlStateNormal];
        
        [nav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
        [self addChildViewController:nav];
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
