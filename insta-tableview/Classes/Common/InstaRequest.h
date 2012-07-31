//
//  InstaRequest.h
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InstaRequestDelegate;

@interface InstaRequest : NSObject
+ (void) fetchEntries: (NSString *)max_id delegate:(id <InstaRequestDelegate>)delegate; 
+ (void) fetchInfo: (id <InstaRequestDelegate>)delegate; 
@end

@protocol InstaRequestDelegate <NSObject>


@optional
- (void) fetchInfoSuccess: (id)resource;
- (void) fetchInfoFailure: (NSError *)error;

- (void) fetchEntriesSuccess: (id)resource;
- (void) fetchEntriesFailure: (NSError *)error;
@end