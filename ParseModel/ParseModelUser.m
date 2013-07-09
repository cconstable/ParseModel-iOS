//
//  ParseModelUser.m
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/4/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Parse/Parse.h>
#import "ParseModelUser.h"

@implementation ParseModelUser

+ (instancetype)parseModel
{
    return [[[self class] alloc] init];
}

+ (instancetype)parseModelUserWithParseUser:(PFUser *)parseUser
{
    return [[[self class] alloc] initWithParseUser:parseUser];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.parseUser = [PFUser user];
    }
    
    return self;
}

- (id)initWithParseUser:(PFUser *)parseUser
{
    self = [super init];
    if (self) {
        self.parseUser = parseUser;
    }
    
    return self;
}

- (id)getValueOfProperty:(NSString *)property
{
    return [self.parseUser objectForKey: property];
}

- (BOOL)setValue:(id)value ofProperty:(NSString *)property
{
    [self.parseUser setObject:value forKey:property];
    return YES;
}

@end
