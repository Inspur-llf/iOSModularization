//
//  AppPluginTools.m
//  cbhycpmasses
//
//  Created by apple on 2020/5/13.
//  Copyright © 2020 浪潮通软储备事业部. All rights reserved.
//

#import "AppPluginTools.h"

@implementation AppPluginTools
+(NSString *)getAppVersionCode{
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return infoDictionary[@"CFBundleShortVersionString"];;
}
@end
