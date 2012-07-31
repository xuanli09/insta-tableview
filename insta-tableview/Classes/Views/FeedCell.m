//
//  FeedCell.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedCell.h"

@implementation FeedCell
@synthesize imgView;
@synthesize activityIndicator;
@synthesize tags;
@synthesize likes;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(10, 0, 300, 300);
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityIndicator setCenter:CGPointMake(imgView.frame.size.width/2 + 10, imgView.frame.size.height/2)];
        
        UIImageView *heart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart"]];
        heart.frame = CGRectMake(10, 310, 10, 10);
        heart.alpha = 0.35f;
        
        likes = [UIButton buttonWithType:UIButtonTypeCustom];
        likes.frame = CGRectMake(25, 305, 300, 20);
        
        [likes setTitle:@"0 likes" forState:UIControlStateNormal];
        likes.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [likes setTitleColor:[UIColor colorWithRed:52.0/255.0f green:109.0/255.0f blue:143.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
        likes.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        
        
        [self addSubview:heart];
        [self addSubview:likes];
        [self addSubview:imgView];        
        [self addSubview:activityIndicator];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
