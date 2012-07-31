//
//  InstaRequest.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InstaRequest.h"
#import "InstaClient.h"

@implementation InstaRequest

+ (void) fetchEntries: (NSString *)max_id delegate:(id <InstaRequestDelegate>)delegate
{
    //Build the GET params
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys: max_id, @"max_id", nil];
    
    [[InstaClient sharedInstance] getPath:@"endpoint.php" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [delegate fetchEntriesSuccess:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate fetchEntriesFailure:error];
    }];
}


+ (void) fetchInfo: (id<InstaRequestDelegate>)delegate
{
    [[InstaClient sharedInstance] getPath:@"info.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [delegate fetchInfoSuccess:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [delegate fetchInfoFailure:error];
    }];
}

@end
