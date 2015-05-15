//
//  ModalViewController.m
//  ReactNativeObjCSample
//
//  Created by Hiroki Yoshifuji on 2015/05/15.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

#import "ModalViewController.h"

#import <RCTRootView.h>
#import <RCTBridgeModule.h>

@interface ModalViewController () <RCTBridgeModule>

@property RCTRootView *rootView;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString* path = [NSString stringWithFormat:@"http://localhost:8081/%@.ios.bundle?dev=true", self.indexName];
    NSURL *jsCodeLocation;
    jsCodeLocation = [NSURL URLWithString:path];
    RCTRootView* rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"SimpleApp"
                                                     launchOptions:nil];
    

    rootView.frame = self.view.bounds;
    [self.view addSubview:rootView];
    
    self.rootView = rootView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close:) name:@"ModalClose" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"ModalClose" object:nil];
}

- (void)close:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.presentingViewController dismissViewControllerAnimated:true completion:nil];
    });
    
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.rootView.frame = self.view.bounds;
}


//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    [self.rootView motionEnded:motion withEvent:event];
//}

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(closeModal)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ModalClose" object:nil];
}


@end
