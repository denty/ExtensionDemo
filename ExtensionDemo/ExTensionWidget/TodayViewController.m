//
//  TodayViewController.m
//  ExTensionWidget
//
//  Created by broy denty on 14-12-22.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "ExTensionTableViewCell.h"

@interface TodayViewController () <NCWidgetProviding>
{
    NSInteger number;
    UITableView *aUITableView;
}
@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    number = 1;
    self.preferredContentSize = CGSizeMake(320, 100*number);
    aUITableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.preferredContentSize.width, self.preferredContentSize.height) style:UITableViewStylePlain];
    [self.view addSubview:aUITableView];
    [aUITableView setBackgroundColor:[UIColor clearColor]];
    [aUITableView setDelegate:self];
    [aUITableView setDataSource:self];
    [aUITableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return number;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndenty = @"ExTensionTableViewCell";
    ExTensionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
    if (cell == nil) {
        cell = [[ExTensionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
    }
    [cell setDelegate:self];
    return cell;
//    static NSString *cellIndenty = @"NewScanExtensionTableViewCell";
//    NewScanExtensionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndenty];
//    if (cell == nil) {
//        cell = [[NewScanExtensionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndenty];
//    }
////    [cell setDelegate:self];
//    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;

}

- (void)openURLContainingAPP
{
    [self.extensionContext openURL:[NSURL URLWithString:@"abcdefg://"]
                 completionHandler:^(BOOL success) {
                     printf("ac");
                     NSLog(@"open url result:%d",success);
                 }];
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}

- (void)OpenAction
{
    [self openURLContainingAPP];
}
@end
