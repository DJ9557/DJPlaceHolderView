//
//  UICollectionView+PlaceHolderView.h
//  PlaceHolderView
//
//  Created by dj on 17/5/17.
//  Copyright © 2017年 dj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (PlaceHolderView)

/**
 是否启用 启动后无数据的时候展示站位图
 */
@property (nonatomic, assign) BOOL enablePlaceHolderView;

/**
 自定义站位图只需赋值给这个view,如无需自定义忽略此属性
 */
@property (nonatomic, strong) UIView *dj_PlaceHolderView;


@end
