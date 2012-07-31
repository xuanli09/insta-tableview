//
//  FeedViewController.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFNetworking.h"
#import "NSDate+helpers.h"

#import "FeedViewController.h"
#import "FeedSectionHeader.h"
#import "FeedCell.h"
#import "TableHeaderView.h"
#import "TableFooterView.h"

@implementation FeedViewController

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
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSMutableArray *data = [self.data valueForKey:@"entries"];
    return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 380;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];  
        cell.selectionStyle = UITableViewCellSelectionStyleNone;         
    }
    
    NSMutableArray *entry = [[self.data valueForKey:@"entries"] objectAtIndex:indexPath.section];
    NSURL *url = [[NSURL alloc] initWithString: [[[entry valueForKey:@"images"] valueForKey:@"low_resolution"] valueForKey:@"url"]];
    
    NSString *likes = [NSString stringWithFormat:@"%@ likes", [[entry valueForKey:@"likes"] valueForKey:@"count"]];
    [cell.likes setTitle:likes forState:UIControlStateNormal];
    
    //Add a spinner while it's downloading
    [cell.activityIndicator startAnimating];
    [cell.imgView setImageWithURLRequest:[[NSURLRequest alloc] initWithURL:url] placeholderImage:[UIImage imageNamed:@"large-thumb"]success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [cell.activityIndicator stopAnimating];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [cell.activityIndicator stopAnimating];
    }];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   
    NSMutableArray *entry = [[self.data valueForKey:@"entries"] objectAtIndex:section];
    FeedSectionHeader *view = [[FeedSectionHeader alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
    
    view.title.text = [[entry valueForKey:@"user"] valueForKey:@"username"];
    view.timeAgo.text = [NSDate fuzzyTime:[entry valueForKey:@"created_time"]];

    [view.avatarImgView setImageWithURL:[[NSURL alloc] initWithString:[[entry valueForKey:@"user"] valueForKey:@"profile_picture"]]];
    
    //Create the timeago text and shift the clock image left
    CGSize size = [view.timeAgo.text sizeWithFont:view.timeAgo.font];
    view.clockImgView.frame = CGRectMake(320 - size.width - 12 - 10 - 5, 15, 12, 12);
    return view;
}



@end
