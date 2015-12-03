//
//  XMTopScrollView.m
//  CloudClassRoom
//
//  Created by rgshio on 15/11/26.
//  Copyright © 2015年 like. All rights reserved.
//

#import "XMTopScrollView.h"
#import "XMTopCell.h"

#define BACK_COLOR [UIColor colorWithRed:(float)225/255 green:(float)225/255 blue:(float)225/255 alpha:1.0f]

@implementation XMTopScrollView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadParam];
        [self loadMainView];
    }
    return self;
}

- (void)loadParam {
    selectRow = 0;
    
    self.textSelectedtColor = [UIColor colorWithRed:(float)0/255 green:(float)113/255 blue:(float)220/255 alpha:1.0f];
    
    self.lineHeight = 2;
    self.separatorHidden = YES;
    self.textDefaultColor = [UIColor blackColor];
    
    list = [[NSMutableArray alloc] init];
}

- (void)loadMainView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
    
    mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    mainCollectionView.showsVerticalScrollIndicator = NO;
    mainCollectionView.showsHorizontalScrollIndicator = NO;
    mainCollectionView.backgroundColor = BACK_COLOR;
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    [self addSubview:mainCollectionView];
    
    lineView = [[UIView alloc] init];
    lineView.backgroundColor = self.textSelectedtColor;
    [mainCollectionView addSubview:lineView];
    
    UINib *nib = [UINib nibWithNibName:@"XMTopCell" bundle:[NSBundle mainBundle]];
    [mainCollectionView registerNib:nib forCellWithReuseIdentifier:@"XMTopCell"];
}

- (void)moveLineView {
    [UIView animateWithDuration:0.3f animations:^{
        lineView.frame = CGRectMake(self.cellWidth*selectRow, self.frame.size.height-self.lineHeight, self.cellWidth, self.lineHeight);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)reloadLineView {
    lineView.frame = CGRectMake(0, self.frame.size.height-self.lineHeight, self.cellWidth, self.lineHeight);
}

#pragma mark - Config Param 
- (void)setTopImage:(UIImage *)topImage {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = topImage;
    mainCollectionView.backgroundView = imageView;
}

- (void)setTopColor:(UIColor *)topColor {
    mainCollectionView.backgroundColor = topColor;
}

- (void)setCellWidth:(NSInteger)cellWidth {
    _cellWidth = cellWidth;
    [self reloadLineView];
}

- (void)setSeparatorHidden:(BOOL)separatorHidden {
    _separatorHidden = separatorHidden;
}

- (void)setLineHeight:(NSInteger)lineHeight {
    _lineHeight = lineHeight;
    [self reloadLineView];
}

- (void)setContentOffset:(CGPoint)contentOffset {
    [mainCollectionView setContentOffset:contentOffset animated:YES];
}

- (CGPoint)contentOffset {
    return mainCollectionView.contentOffset;
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"XMTopCell";
    XMTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.titleLabel.text = list[indexPath.row];
    
    if (indexPath.row == selectRow) {
        cell.titleLabel.textColor = self.textSelectedtColor;
    }else {
        cell.titleLabel.textColor = self.textDefaultColor;
    }
    
    if (indexPath.row == 0) {
        cell.lineView.hidden = YES;
    }else {
        cell.lineView.hidden = NO;
    }
    cell.lineView.hidden = self.separatorHidden;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (selectRow != indexPath.row) {
        selectRow = indexPath.row;
        [self moveLineView];
        [self reloadView];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectClickAction:)]) {
            [self.delegate selectClickAction:indexPath.row];
        }
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(self.cellWidth, self.frame.size.height);
    return size;
}

#pragma mark - API
- (void)reloadViewWith:(NSMutableArray *)dataArray {
    list = dataArray;
    [self reloadView];
}

- (void)reloadView {
    [mainCollectionView reloadData];
}

@end
