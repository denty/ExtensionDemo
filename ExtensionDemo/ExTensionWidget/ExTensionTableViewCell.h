//
//  ExTensionTableViewCell.h
//  ExtensionDemo
//
//  Created by broy denty on 14-12-22.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayScrollerView.h"

@protocol ExTensionTableViewCellDelegate <NSObject>

- (void)OpenAction;

@end

@interface ExTensionTableViewCell : UITableViewCell <TodayScrollerViewDelegate>
@property (weak, nonatomic) IBOutlet TodayScrollerView *scanHolder;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) id<ExTensionTableViewCellDelegate> delegate;

@end
