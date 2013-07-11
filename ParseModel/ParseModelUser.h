//
//  ParseModelUser.h
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/4/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "ParseModelBase.h"

@class PFUser;

@interface ParseModelUser : ParseModelBase

@property (nonatomic, strong) PFUser *parseUser;

+ (instancetype)parseModelUserWithParseUser:(PFUser *)parseUser;

/**
 This registers this particular ParseModelUser class to be instantiated
 whenever we come across a PFUser object.
 */
+ (void)registerParseModelUser;

- (id)initWithParseUser:(PFUser *)parseUser;

@end
