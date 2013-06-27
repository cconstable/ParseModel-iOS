//
//  ParseModelUtils.m
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/26/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Parse/Parse.h>
#import "ParseModelUtils.h"

#import "ParseModel.h"
#import "ParseModelUser.h"

@implementation ParseModelUtils

+ (id)performBoxingIfNecessary:(id)object
{
    id boxedObject = object;
    
    if ([object isKindOfClass:[CLLocation class]]) {
        boxedObject = [PFGeoPoint geoPointWithLocation:object];
    }
    else if([object isKindOfClass:[NSURL class]]) {
        boxedObject = [(NSURL *)object absoluteString];
    }
    else if ([object isKindOfClass:[ParseModel class]]) {
        boxedObject = [(ParseModel *)object parseObject];
    }
    else if ([object isKindOfClass:[ParseModelUser class]]) {
        boxedObject = [(ParseModelUser *)object parseUser];
    }
    
    return boxedObject;
}

+ (id)performUnboxingIfNecessary:(id)object targetClass:(Class)targetClass
{
    id unboxedObject = object;
    
    if ((targetClass == [CLLocation class]) && [object isKindOfClass:[PFGeoPoint class]]) {
        unboxedObject = [[CLLocation alloc] initWithLatitude:[(PFGeoPoint *)object latitude] longitude:[(PFGeoPoint *)object longitude]];
    }
    else if((targetClass == [NSURL class]) && [object isKindOfClass:[NSString class]]) {
        unboxedObject = [NSURL URLWithString:object];
    }
    else if (([targetClass isSubclassOfClass:[ParseModel class]]) && [object isKindOfClass:[PFObject class]]) {
        unboxedObject = [((ParseModel *)[targetClass alloc]) initWithParseObject:object];
    }
    else if (([targetClass isSubclassOfClass:[ParseModelUser class]]) && [object isKindOfClass:[PFUser class]]) {
        unboxedObject = [((ParseModelUser *)[targetClass alloc]) initWithParseUser:object];
    }
    
    return unboxedObject;
}

@end
