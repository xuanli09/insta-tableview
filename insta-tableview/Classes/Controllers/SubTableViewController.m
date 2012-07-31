//
//  SubTableViewController.m
//  insta-tableview
//
//  Created by Xuan Li on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SubTableViewController.h"
#import "TableHeaderView.h"
#import "TableFooterView.h"

@implementation SubTableViewController
@synthesize delegate;
@synthesize data;
@synthesize reload;

#pragma mark - View Lifecycle
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor clearColor];
    
    //Register for a notification to reload the data 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData)                                               name:@"DataUpdateNotification" object:nil];
    
    TableHeaderView *tableHeaderView  = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 45)];
    self.tableView.tableHeaderView = tableHeaderView;
    
    TableFooterView *tableFooterView = [[TableFooterView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    self.tableView.tableFooterView = tableFooterView;
    
    //Attach action to Load More Button
    [tableFooterView.more addTarget:self 
                             action:@selector(loadMore:)
                   forControlEvents:UIControlEventTouchDown];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



#pragma mark - actions
//Load More Entries only if there's none queued up
- (void) loadMore :(id)sender{
    if(reload){
        [self reloadData];
        reload = NO;
    } else {
        [delegate loadMore:sender];
    }
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}


#pragma mark - Notification responders
- (void) reloadData {
    NSDictionary *meta = [[data valueForKey:@"meta"] valueForKey:@"data"];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init]; 
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    TableHeaderView *headerView = (TableHeaderView *)self.tableView.tableHeaderView;
    TableFooterView *footerView = (TableFooterView *)self.tableView.tableFooterView;
    
    //Update the Hashtag and the PhotoCount. Update any other meta information here
    NSString *time = [formatter stringFromNumber:[NSNumber numberWithInt:[[meta valueForKey:@"media_count"] intValue]]];
    headerView.hashtag.text = [NSString stringWithFormat:@"#%@", [meta valueForKey:@"name"]];
    headerView.count.text = [NSString stringWithFormat:@"%@ photos",  time];
    
    footerView.more.enabled = YES;
    footerView.more.alpha = 1.0f;
    
    //Don't bother if the current view is not visible, instead queue the next time the view becomes visible and user taps loadmore
    if(![self.view superview]) {
        reload = true;
    } else {
        [self.tableView reloadData];
    }
}

@end
