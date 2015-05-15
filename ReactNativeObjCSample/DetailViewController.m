//
//  DetailViewController.m
//  ReactNativeObjCSample
//
//  Created by Hiroki Yoshifuji on 2015/04/24.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

#import "DetailViewController.h"


#import <RCTRootView.h>

#import <RCTBridge.h>
#import <RCTEventDispatcher.h>

@interface DetailViewController ()

@property RCTRootView *rootView;
@property (weak, nonatomic) IBOutlet UIView *wrapView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?dev=true"];
    RCTRootView* rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"SimpleApp"
                                                     launchOptions:nil];
    

    rootView.frame = self.wrapView.bounds;
    [self.wrapView addSubview:rootView];
    
    self.rootView = rootView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.rootView.frame = self.wrapView.bounds;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    [self.rootView motionEnded:motion withEvent:event];
}
- (IBAction)tappedButton:(id)sender {
    [self.rootView.bridge.eventDispatcher sendDeviceEventWithName:@"callFuncName"
                                                 body:@{@"name": @"native-js"}];

}

@end


#import "RCTBridgeModule.h"

@interface SampleManager : NSObject <RCTBridgeModule>
@end

@implementation SampleManager

+ (NSString *)moduleName {
    __attribute__((used, section("__DATA,RCTExportModule")))
    static const char *__rct_export_entry__ = { __func__ };
    return nil;
};


//RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(callFunc:(NSString *)name param:(NSString *)param dict:(NSDictionary*)dict findEvents:(RCTResponseSenderBlock)callback)
{
    NSLog(@"name: %@", name);
    NSLog(@"str:  %@", param);
    NSLog(@"dict: %@", dict);
    
    
    callback(@[ [NSNull null], @{ @"name": @"js->native" } ]);
}

@end

