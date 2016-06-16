//
//  TableFooterView.m
//  insta-tableview
//
//  Created by Xuan Li on 7/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableFooterView.h"

@implementation TableFooterView
@synthesize more;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        more = [UIButton buttonWithType:UIButtonTypeCustom];
        more.frame = CGRectMake(90, 5, 140, 30);

        UIImage *buttonImage = [[UIImage imageNamed:@"greyButton.png"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        UIImage *buttonImageHighlight = [[UIImage imageNamed:@"greyButtonHighlight.png"]
                                         resizableImageWithCapInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
        
        
        
        // Set the background for any states you plan to use
        [more setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [more setBackgroundImage:buttonImage forState:UIControlStateDisabled];
        [more setBackgroundImage:buttonImageHighlight forState:UIControlStateHighlighted];
        
        more.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        
        [more setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [more setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [more setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        [more setTitle:@"Load More" forState:UIControlStateNormal];
        [more setTitle:@"Loading..." forState:UIControlStateDisabled];
        
        [self addSubview:more];
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
