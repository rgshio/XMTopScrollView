//
//  ViewController.m
//  XMTopScrollView
//
//  Created by rgshio on 15/12/21.
//  Copyright © 2015年 rgshio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _titleArray = [[NSMutableArray alloc] initWithArray:@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
    
    _topView = [[XMTopScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    _topView.delegate = self;
    _topView.cellCount = 3;
    _topView.showType = XMTopItemShowTypeCenter;
    _topView.separatorHidden = NO;
    _topView.textSelectedtColor = [UIColor blackColor];
    [_topView reloadViewWith:_titleArray];
    [self.view addSubview:_topView];
}

- (void)selectClickAction:(NSInteger)index {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
