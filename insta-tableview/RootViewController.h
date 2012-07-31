//
//  RootViewController.h
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstaRequest.h"
#import "SubTableViewController.h"
#import "FeedViewController.h"
#import "GalleryViewController.h"

@class FeedViewController, GalleryViewController;

@interface RootViewController : UIViewController <InstaRequestDelegate, SubTableViewDelegate>

@property (strong, nonatomic) FeedViewController *feedViewController;
@property (strong, nonatomic) GalleryViewController *galleryViewController;

@property (strong, nonatomic) NSMutableDictionary *data;

//Remember these for each data request
@property (copy, nonatomic) NSString *max_id;

@end
