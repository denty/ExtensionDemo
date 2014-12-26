//
//  ExTensionTableViewCell.m
//  ExtensionDemo
//
//  Created by broy denty on 14-12-22.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ExTensionTableViewCell.h"

@implementation ExTensionTableViewCell
{
    CGPoint lastPoint;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [[[NSBundle mainBundle] loadNibNamed:reuseIdentifier owner:self options:nil] lastObject];
    if (self != nil) {
//        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
//        [self.scanHolder addGestureRecognizer:panGesture];
//        [panGesture setDelegate:self];
    }
    return self;
}

- (void)awakeFromNib {
    [self.scanHolder setDelgate:self];
    [self.iconImage.layer setAnchorPoint:CGPointMake(0.5,0.5 )];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)TodayScrollerTouchesMoved:(CGPoint)point
{
    CGFloat scale = point.x/100.f;
    [self.iconImage.layer setTransform:CATransform3DMakeScale(scale, scale, scale)];
}

- (void)TodayScrollerTouchesEnded:(CGPoint)point
{
    [self.delegate OpenAction];
}
//- (void)panAction:(UIGestureRecognizer*) sender
//{
//    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer*)sender;
////    UIGestureRecognizerStateBegan    UIGestureRecognizerStateChanged    UIGestureRecognizerStateEnded,
//    if (panGesture.state == UIGestureRecognizerStateBegan) {
//        lastPoint = [panGesture translationInView:self.scanHolder];
//    }else if (panGesture.state == UIGestureRecognizerStateChanged)
//    {
//        CGPoint newPoint = [panGesture translationInView:self.scanHolder];
//        [self.scanHolder setFrame:CGRectMake(newPoint.x-lastPoint.x, self.scanHolder.frame.origin.y, self.scanHolder.frame.size.width, self.scanHolder.frame.size.height)];
//    }
//    else if (panGesture.state == UIGestureRecognizerStateEnded)
//    {
//        
//    }
//}

//-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
//    // We only want to deal with the gesture of it's a pan gesture
//    if ([panGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
//        CGPoint translation = [panGestureRecognizer translationInView:[self superview]];
//        return (fabs(translation.x) / fabs(translation.y) > 1) ? YES : NO;
//    } else {
//        return NO;
//    }
//}


@end
