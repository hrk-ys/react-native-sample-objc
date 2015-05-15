//
//  MasterViewController.m
//  ReactNativeObjCSample
//
//  Created by Hiroki Yoshifuji on 2015/04/24.
//  Copyright (c) 2015年 Hiroki Yoshifuji. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ModalViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass:[ModalViewController class]]) {
            
            UITableViewCell* cell = sender;
            ModalViewController* vc = segue.destinationViewController;
            vc.indexName = cell.textLabel.text;
        }
    }
}
@end
