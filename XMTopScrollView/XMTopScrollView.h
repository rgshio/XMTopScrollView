//
//  XMTopScrollView.h
//  CloudClassRoom
//
//  Created by rgshio on 15/11/26.
//  Copyright © 2015年 like. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XMTopScrollViewDelegate <NSObject>

- (void)selectClickAction:(NSInteger)index;

@end

@interface XMTopScrollView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    UICollectionView                *mainCollectionView;
    UIScrollView                    *mainScrollView;
    UIView                          *lineView;
    
    NSMutableArray                  *list;
    
    NSUInteger                      selectRow;
}

@property (nonatomic, weak) id <XMTopScrollViewDelegate> delegate;

- (void)reloadViewWith:(NSMutableArray *)dataArray;

/**
 * 背景图片
 **/
@property (nonatomic, strong) UIImage *topImage;

/**
 * 背景色
 **/
@property (nonatomic, strong) UIColor *topColor;

/**
 * cell的宽度
 **/
@property (nonatomic, assign) NSInteger cellWidth;

/**
 * cell分割线是否隐藏,默认显示
 **/
@property (nonatomic, assign) BOOL separatorHidden;

/**
 * 滑线的高度,默认为2
 **/
@property (nonatomic, assign) NSInteger lineHeight;

/**
 * collectionView的偏移量
 **/
@property (nonatomic, assign) CGPoint contentOffset;

/**
 * 字体默认颜色
 **/
@property (nonatomic, strong) UIColor *textDefaultColor;

/**
 * 字体选中颜色
 **/
@property (nonatomic, strong) UIColor *textSelectedtColor;

@end
