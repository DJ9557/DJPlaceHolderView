//
//  UICollectionView+PlaceHolderView.m
//  PlaceHolderView
//
//  Created by dj on 17/5/17.
//  Copyright © 2017年 dj. All rights reserved.
//

#import "UICollectionView+PlaceHolderView.h"

#import "NSObject+MethodSwizzle.h"
#import "DefaultView.h"

@implementation UICollectionView (PlaceHolderView)


+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(reloadData) withMethod:@selector(dj_reloadData)];
    });
}

- (void)dj_reloadData
{
    if (self.enablePlaceHolderView) {
        NSInteger sectionCount =  [self.dataSource respondsToSelector:@selector(numberOfSectionsInCollectionView:)] ? [self.dataSource numberOfSectionsInCollectionView:self] : 1;
        NSInteger rowCount = 0;
        for (int i = 0; i < sectionCount; i++) {
            rowCount += [self.dataSource collectionView:self numberOfItemsInSection:i];
        }
        if (rowCount == 0) {

            [self addSubview:self.dj_PlaceHolderView];
        }
        else
        {
            [self.dj_PlaceHolderView removeFromSuperview];
        }
    }
    [self dj_reloadData];
}


- (void)setEnablePlaceHolderView:(BOOL)enblePlaceHolderView
{
    objc_setAssociatedObject(self, @selector(enablePlaceHolderView), @(enblePlaceHolderView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)enablePlaceHolderView
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(enablePlaceHolderView));
    return number.boolValue;
}

- (void)setDj_PlaceHolderView:(UIView *)dj_PlaceHolderView
{
    objc_setAssociatedObject(self, @selector(dj_PlaceHolderView), dj_PlaceHolderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)dj_PlaceHolderView
{
    UIView *placeHolder = objc_getAssociatedObject(self, @selector(dj_PlaceHolderView));
    if (!placeHolder) {
        placeHolder  = [[DefaultView alloc] initWithFrame:self.bounds];

        self.dj_PlaceHolderView = placeHolder;
    }
    return placeHolder;
}

@end
