//
//  DetailViewController.m
//  insta-tableview
//
//  Created by Xuan Li on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "FeedCell.h"
#import "FeedSectionHeader.h"

#import "AFNetworking.h"
#import "NSDate+helpers.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize entry;

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
    self.title = @"PHOTO";
}



- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 380;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[FeedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];  
        cell.selectionStyle = UITableViewCellSelectionStyleNone;         
    }
    
    NSURL *url = [[NSURL alloc] initWithString: [[[entry valueForKey:@"images"] valueForKey:@"low_resolution"] valueForKey:@"url"]];
    
    //Add a spinner while it's downloading
    [cell.activityIndicator startAnimating];
    [cell.imgView setImageWithURLRequest:[[NSURLRequest alloc] initWithURL:url] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [cell.activityIndicator stopAnimating];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [cell.activityIndicator stopAnimating];
    }];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{   
    FeedSectionHeader *view = [[FeedSectionHeader alloc] initWithFrame:CGRectMake(10,0,300,40)];
    
    view.title.text = [[entry valueForKey:@"user"] valueForKey:@"username"];
    view.timeAgo.text = [NSDate fuzzyTime:[entry valueForKey:@"created_time"]];
    
    [view.avatarImgView setImageWithURL:[[NSURL alloc] initWithString:[[entry valueForKey:@"user"] valueForKey:@"profile_picture"]]];
    
    CGSize size = [view.timeAgo.text sizeWithFont:view.timeAgo.font];
    view.clockImgView.frame = CGRectMake(320 - size.width - 12 - 10 - 5, 15, 12, 12);
    return view;
}



#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Do nothing
}

@end
