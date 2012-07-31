//
//  FeedSectionHeader.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedSectionHeader.h"

@implementation FeedSectionHeader
@synthesize title;
@synthesize avatarImgView;
@synthesize timeAgo;
@synthesize clockImgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10,0,300,40)] ;
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.95];
             
        // create the label objects
        title = [[UILabel alloc] initWithFrame: CGRectMake(45,10,200,20)];
        title.backgroundColor = [UIColor clearColor];
        title.font = [UIFont boldSystemFontOfSize:15];
        title.textColor = [UIColor colorWithRed:46.0f/255.0f green:94.0f/255.0f blue:134.0f/255.0f alpha:1.0f];
        
        timeAgo = [[UILabel alloc] initWithFrame: CGRectMake(200,10,110,20)];
        timeAgo.backgroundColor = [UIColor clearColor];
        timeAgo.font = [UIFont boldSystemFontOfSize:15];
        timeAgo.textColor = [UIColor colorWithRed:155.0f/255.0f green:155.0f/255.0f blue:155.0f/255.0f alpha:1.0f];
        timeAgo.textAlignment = UITextAlignmentRight;
        
        
        avatarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 30, 30)];
        
        clockImgView = [[UIImageView alloc] init];
        clockImgView.alpha = 0.45f;
        clockImgView.image = [UIImage imageNamed:@"clock.png"];
        
        [self addSubview:avatarImgView];
        [self addSubview:title];
        [self addSubview:timeAgo];
        [self addSubview:clockImgView];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
