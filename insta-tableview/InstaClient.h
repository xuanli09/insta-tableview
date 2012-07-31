//
//  InstaClient.h
//  insta-tableview
//
//  Created by Xuan Li on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"

@interface InstaClient : AFHTTPClient

+ (InstaClient *)sharedInstance;

@end
