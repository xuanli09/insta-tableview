//
//  RootViewController.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "TitleView.h"
#import "TableFooterView.h"
#import "TableHeaderView.h"
#import "DetailViewController.h"
#define kLimit 16

@interface RootViewController ()

@end

@implementation RootViewController
@synthesize feedViewController;
@synthesize galleryViewController;
@synthesize data;
@synthesize max_id;

#pragma mark - View Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    //Setup the data structure - Core Data and Models are your real replacement to this kind of stuff
    NSMutableDictionary *meta = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Unknown", @"tag", @"N/A", @"photos", nil];
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    data = [[NSMutableDictionary alloc] initWithObjectsAndKeys: meta, @"meta", entries, @"entries", nil];
    
    //Create the Title View Switch and attach an action on tap
    TitleView *titleView = [[TitleView alloc] initWithFrame:CGRectMake(70, 0, 180, 50)];
    [titleView.segmentedControl addTarget:self action:@selector(switchTab:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = titleView;

    //Create a Refresh Button / Unused at the moment
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
    
    self.navigationItem.rightBarButtonItem = button;
    
    //Create the two View Controllers 
    galleryViewController = [[GalleryViewController alloc] init];
    feedViewController = [[FeedViewController alloc] init];
    
    //Set the Delegates and set the Data pointer
    galleryViewController.data = data;
    galleryViewController.delegate = self;
    feedViewController.data = data;
    feedViewController.delegate = self;    
    
    //Attach only the Gallery view for now, on switch attach/remove the views as needed
    [self.view addSubview:galleryViewController.view];
    galleryViewController.view.frame = self.view.bounds;
    
    //Dispatch an async request for data
    [InstaRequest fetchInfo:self];
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self]; 
    [feedViewController setDelegate:nil];
    [galleryViewController setDelegate:nil];
}

#pragma mark - Switches and Buttons
- (void)switchTab :(id)sender 
{
    UISegmentedControl *segmentedControl = sender;
    if(segmentedControl.selectedSegmentIndex == 0){
        [feedViewController.view removeFromSuperview];
        [self.view addSubview:galleryViewController.view];
        galleryViewController.view.frame = self.view.bounds;
    } else {
        [galleryViewController.view removeFromSuperview];
        [self.view addSubview:feedViewController.view];
        feedViewController.view.frame = self.view.bounds;
    }
} 

- (void)refresh :(id)sender 
{
    //To be implemented - 
}


#pragma mark - SubTableView Delegate
- (void) loadDetail:(NSInteger)entry_id 
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.entry = [[data valueForKey:@"entries"] objectAtIndex:entry_id];    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void) loadMore :(id)sender{
    UIButton *btn = sender;
    btn.enabled = NO;
    btn.alpha = 0.45f;
    [InstaRequest fetchEntries:max_id delegate:self];
}



#pragma mark - InstaRequest delegate
- (void) fetchInfoSuccess:(id)resource
{
    [data setObject:resource forKey:@"meta"];
    [self loadMore:nil];
}

- (void) fetchInfoFailure:(NSError *)error
{
    NSLog(@"Fetch Meta Failure");
}

- (void)fetchEntriesSuccess:(id)resource
{   
    NSMutableArray *entries = [data valueForKey:@"entries"];
    max_id = [[resource valueForKey:@"pagination"] valueForKey:@"next_max_tag_id"] ;
    
    //Add more entries to the dataset
    for(NSDictionary *entry in [resource valueForKey:@"data"])
        [entries addObject:entry];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DataUpdateNotification" object:nil];
}

- (void) fetchEntriesFailure:(NSError *)error {
    NSLog(@"Fetch Feed Entry Failure");
}

@end
