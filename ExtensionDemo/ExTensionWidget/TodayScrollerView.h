//
//  TodayScrollerView.h
//  ExtensionDemo
//
//  Created by broy denty on 14-12-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TodayScrollerViewDelegate <NSObject>

- (void)TodayScrollerTouchesEnded:(CGPoint)point;
- (void)TodayScrollerTouchesMoved:(CGPoint)point;


@end
@interface TodayScrollerView : UIView
@property (nonatomic, weak) id<TodayScrollerViewDelegate> delgate;
@end
