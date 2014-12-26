//
//  NewScanExtensionTableViewCell.m
//  ExtensionDemo
//
//  Created by broy denty on 14-12-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "NewScanExtensionTableViewCell.h"

@implementation NewScanExtensionTableViewCell
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
    // Initialization code
    [self.scanHolderView setDelgate:self];
    [self.actionImage.layer setAnchorPoint:CGPointMake(0.5,0.5 )];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)TodayScrollerTouchesMoved:(CGPoint)point
{
    if (point.x<100) {
        CGFloat scale = (100.0f-point.x)/100.f;
        [self.actionImage.layer setTransform:CATransform3DMakeScale(scale, scale, scale)];
    }
    [self.barcodeImage setFrame:CGRectMake(270-(point.x+15), self.barcodeImage.frame.origin.y, self.barcodeImage.frame.size.width, self.barcodeImage.frame.size.height)];
}

- (void)TodayScrollerTouchesEnded:(CGPoint)point
{
//    [self.delegate OpenAction];
}
@end
