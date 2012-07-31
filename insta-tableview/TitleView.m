//
//  TitleView.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TitleView.h"

@implementation TitleView
@synthesize segmentedControl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        segmentedControl = [[UISegmentedControl alloc] init];
        [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"Grid View 2.png"] atIndex:0 animated:NO];
        [segmentedControl insertSegmentWithImage:[UIImage imageNamed:@"Equalizer 1.png"] atIndex:1 animated:NO];
        
        segmentedControl.frame = CGRectMake(self.bounds.origin.x + 30, self.bounds.origin.y + 10, self.bounds.size.width - 60, self.bounds.size.height - 20);
        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        segmentedControl.selectedSegmentIndex = 0;
        
        UIImage *segmentSelected = [[UIImage imageNamed:@"segment-selected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
        
        UIImage *segmentUnSelected = [[UIImage imageNamed:@"segment-unselected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];

        [segmentedControl setBackgroundImage:segmentUnSelected forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [segmentedControl setBackgroundImage:segmentSelected forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
                
        UIImage *segUnselectedSelected = [UIImage imageNamed:@"unsel-sel.png"];
        UIImage *segmentSelectedUnselected = [UIImage imageNamed:@"sel-unsel.png"];
        
        [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [[UISegmentedControl appearance] setDividerImage:segUnselectedSelected forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        //norma normal
        [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        segmentedControl.selectedSegmentIndex = 0;
        [self addSubview:segmentedControl];
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
