//
//  RCTCustomManager.m
//  ReactNativeObjCSample
//
//  Created by Hiroki Yoshifuji on 2015/04/26.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

#import "RCTCustomManager.h"

#import "RCTBridge.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"

@implementation RCTCustomManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    UIView* view =  [[UIView alloc] init];
    [view setBackgroundColor:[UIColor blueColor]];
    return view;
}


@end
