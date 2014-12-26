//
//  TodayScrollerView.m
//  ExtensionDemo
//
//  Created by broy denty on 14-12-23.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TodayScrollerView.h"

@implementation TodayScrollerView
{
    CGFloat lastPoint;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [event.allTouches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    lastPoint = touchPoint.x;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [event.allTouches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if ((touchPoint.x-lastPoint)>self.frame.origin.x&&120>touchPoint.x-lastPoint)
    {
        [CATransaction begin];
        [CATransaction setValue:[NSNumber numberWithFloat:1]
                         forKey:kCATransactionAnimationDuration];
        [self setFrame:CGRectMake(touchPoint.x-lastPoint, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height)];
        [CATransaction commit];
        [self.delgate TodayScrollerTouchesMoved:CGPointMake(touchPoint.x-lastPoint, touchPoint.y)];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.25 animations:^{
        [self setFrame:CGRectMake(0, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height)];
    }];
    UITouch *touch = [event.allTouches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
//    if (touchPoint.x>150) {
        [self.delgate TodayScrollerTouchesEnded:touchPoint];
//    }
}
@end
