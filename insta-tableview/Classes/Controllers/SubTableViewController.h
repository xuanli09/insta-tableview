//
//  SubTableViewController.h
//  insta-tableview
//
//  Created by Xuan Li on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SubTableViewDelegate;


@interface SubTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) NSDictionary *data;
@property (weak, nonatomic) id<SubTableViewDelegate> delegate;
@property (nonatomic) BOOL reload;

@end



@protocol SubTableViewDelegate <NSObject>

@optional 

- (void) loadMore :(id)sender;
- (void) loadDetail :(NSInteger)entry_id;


@end