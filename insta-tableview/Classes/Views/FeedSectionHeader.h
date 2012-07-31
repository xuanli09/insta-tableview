//
//  FeedSectionHeader.h
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedSectionHeader : UIView

@property (strong, nonatomic) UIImageView *avatarImgView;
@property (strong, nonatomic) UILabel *title;

@property (strong, nonatomic) UILabel *timeAgo;
@property (strong, nonatomic) UIImageView *clockImgView;

@end
