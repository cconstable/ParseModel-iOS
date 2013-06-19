//
//  TestObject.m
//  ParseModel
//
//  Created by Christopher Constable on 6/3/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

// Make sure you set the properties you want to be mapped to the
// PFObject as dynamic!
@dynamic someString;
@dynamic someOtherString;
@dynamic someUrl;
@dynamic anInteger;
@dynamic aDate;
@dynamic location;

// When you "init" your object, this string is used to initialize
// the PFObject.
+ (NSString *)parseModelClass
{
    return @"TestObject";
}

@end
