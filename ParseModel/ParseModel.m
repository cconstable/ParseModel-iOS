//
//  ParseModel.m
//  ParseModel
//
//  Parse Adaptation:
//  Created by Christopher Constable on 6/3/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Parse/Parse.h>
#import "ParseModel.h"
#import "ParseModelUser.h"
#import "ParseModelUtils.h"

@implementation ParseModel

+ (NSString *)parseModelClass
{
    // Default Implementation.
    // Override.
    
    return @"";
}

+ (instancetype)parseModelWithParseObject:(PFObject *)parseObject
{
    return [[[self class] alloc] initWithParseObject:parseObject];
}

+ (instancetype)parseModel
{
    return [[[self class] alloc] init];
}

+ (void)registerParseModel
{
    [[ParseModelUtils sharedUtilities] registerParseModel:self];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.parseObject = [PFObject objectWithClassName:[[self class] parseModelClass]];
    }
    
    return self;
}

- (id)initWithParseObject:(PFObject *)parseObject
{
    self = [super init];
    if (self) {
        self.parseObject = parseObject;
    }
    
    return self;
}

- (id)getValueOfProperty:(NSString *)property
{
    return [self.parseObject objectForKey:property];
}

- (BOOL)setValue:(id)value ofProperty:(NSString *)property
{
    [self.parseObject setObject:value forKey:property];
    return YES;
}

@end