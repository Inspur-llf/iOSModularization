//
//  AppPlugin.m
//  cbhycpmasses
//
//  Created by apple on 2020/5/7.
//  Copyright © 2020 浪潮通软储备事业部. All rights reserved.
//

#import "AppPlugin.h"
#import <StoreKit/StoreKit.h>
@interface AppPlugin ()<SKStoreProductViewControllerDelegate>

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
    }else if ([@"getAppName" isEqualToString:methodName]) {
        return infoDictionary[@"CFBundleDisplayName"];
    }else if ([@"getNetWorkType" isEqualToString:methodName]) {
        return [WJSaveUserMessagerManager objectForKey:@"network"];
    }
    else if ([@"getAppVersionName" isEqualToString:methodName]) {
        return infoDictionary[@"CFBundleShortVersionString"];
    }
    else if ([@"appCheckUpdate" isEqualToString:methodName]) {
        [self openAppWithIdentifier:@"11"];
    }

    return @"";
}

- (void)openAppWithIdentifier:(NSString*)appId{

  SKStoreProductViewController *storeProductVC =  [[SKStoreProductViewController alloc] init];

  storeProductVC.delegate = self;

  NSDictionary* dict = [NSDictionary dictionaryWithObject:appId forKey:SKStoreProductParameterITunesItemIdentifier];

  [storeProductVC loadProductWithParameters:dict completionBlock:^(BOOL result,NSError*error) {

  if(result) {
    //__weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:storeProductVC animated:YES completion:nil];
    });
   //[self presentViewController:storeProductVC animated:YES completion:nil];

  }

  }];

}

#pragma mark -协议方法

- (void)productViewControllerDidFinish:(SKStoreProductViewController*)viewController{

  NSLog(@"关闭界面");
//  dispatch_async(dispatch_get_main_queue(), ^{
       
//  [[[UIApplication sharedApplication] keyWindow].rootViewController dismissViewControllerAnimated:YES completion:nil];
//
//  });
  [viewController dismissViewControllerAnimated:YES completion:nil];

}
@end
