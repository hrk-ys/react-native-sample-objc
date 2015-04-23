//
//  DetailViewController.h
//  ReactNativeObjCSample
//
//  Created by Hiroki Yoshifuji on 2015/04/24.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

