//
//  FeedCell.h
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) UIButton *likes;

@property (strong, nonatomic) NSMutableArray *tags;

@end
