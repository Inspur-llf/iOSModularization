//
//  AppPlugin.m
//  cbhycpmasses
//
//  Created by apple on 2020/5/7.
//  Copyright © 2020 浪潮通软储备事业部. All rights reserved.
//

#import "AppPlugin.h"
@interface AppPlugin ()

@end

@implementation AppPlugin

- (NSString *)execute:(WKWebView *)webView andParams:(NSDictionary*)params
{
    self.currentWebView = webView;
    
    // 执行方法名称
    NSString* methodName = [params objectForKey:@"methodName"];
    
    //APP信息
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    if ([@"getAppVersionCode" isEqualToString:methodName]) {
        return infoDictionary[@"CFBundleShortVersionString"];
    }
    

    return @"";
}


@end
