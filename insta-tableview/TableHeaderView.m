//
//  TableHeaderView.m
//  insta-tableview
//
//  Created by Xuan Li on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableHeaderView.h"

@implementation TableHeaderView
@synthesize hashtag;
@synthesize count;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // create the label objects
        hashtag = [[UILabel alloc] initWithFrame: CGRectMake(10, 14, 200, 20)];
        hashtag.backgroundColor = [UIColor clearColor];
        hashtag.font = [UIFont boldSystemFontOfSize:20];
        hashtag.textColor = [UIColor whiteColor];  
        hashtag.text = @"#Unknown";
        hashtag.shadowColor = [UIColor blackColor];
        hashtag.shadowOffset = CGSizeMake(1.0, 2.0);
        
        
        count = [[UILabel alloc] initWithFrame: CGRectMake(10, 14, 300, 20)];
        count.backgroundColor = [UIColor clearColor];
        count.font = [UIFont systemFontOfSize:16.0f];
        count.textColor = [UIColor whiteColor];  
        count.textAlignment = UITextAlignmentRight;
        count.text = @"N/A photos";
        count.shadowColor = [UIColor blackColor];
        count.shadowOffset = CGSizeMake(1.0, 2.0);
        
        self.backgroundColor = [UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:1.0f];
        
        [self addSubview:hashtag];
        [self addSubview:count];
    }
    
    return self;
}



@end
