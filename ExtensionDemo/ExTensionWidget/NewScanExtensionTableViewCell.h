//
//  NewScanExtensionTableViewCell.h
//  ExtensionDemo
//
//  Created by broy denty on 14-12-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayScrollerView.h"

@interface NewScanExtensionTableViewCell : UITableViewCell <TodayScrollerViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *actionImage;
@property (weak, nonatomic) IBOutlet TodayScrollerView *scanHolderView;

@property (weak, nonatomic) IBOutlet UIImageView *barcodeImage;
@end
