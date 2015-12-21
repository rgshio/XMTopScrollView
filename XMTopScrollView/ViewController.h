//
//  ViewController.h
//  XMTopScrollView
//
//  Created by rgshio on 15/12/21.
//  Copyright © 2015年 rgshio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMTopScrollView.h"

@interface ViewController : UIViewController <XMTopScrollViewDelegate> {
    XMTopScrollView                     *_topView;
    
    NSMutableArray                      *_titleArray;
}


@end

