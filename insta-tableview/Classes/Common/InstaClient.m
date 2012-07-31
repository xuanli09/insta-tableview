//
//  InstaClient.m
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFNetworking.h"
#import "InstaClient.h"

@implementation InstaClient

static NSString * const kInstaURLString = @"http://instagram.xuanli.us";


+ (InstaClient *)sharedInstance {
    static InstaClient *__sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[InstaClient alloc] initWithBaseURL:
                            [NSURL URLWithString:kInstaURLString]];
    });
    
    return __sharedInstance;
}


- (InstaClient *)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        //custom settings
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    
    return self;
}

//Overriden to provide an activity spinner
- (void) getPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure{
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [super getPath:path parameters:parameters success:success failure:failure];
}


@end
