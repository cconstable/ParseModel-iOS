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

+ (instancetype)sharedUtilities
{
    static dispatch_once_t onceToken;
    static ParseModelUtils *parseModelUtils;
    
    if (!parseModelUtils) {
        dispatch_once(&onceToken, ^{
            parseModelUtils = [[ParseModelUtils alloc] init];
        });
    }
    
    return parseModelUtils;
}

- (id)performBoxingIfNecessary:(id)object
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
    
    // Let's get recursive
    // Handle arrays and dictionaries...
    else if ([object isKindOfClass:[NSArray class]]) {
        NSMutableArray *boxedArray = [NSMutableArray array];
        for (id interalObject in object) {
             [boxedArray addObject:[[ParseModelUtils sharedUtilities] performBoxingIfNecessary:interalObject]];
        }
        boxedObject = boxedArray;
    }
    else if ([object isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *boxedDictionary = [NSMutableDictionary dictionary];
        NSArray *keys = [object allKeys];
        for (id key in keys) {
            id boxedKey = [[ParseModelUtils sharedUtilities] performBoxingIfNecessary:key];
            id boxedValue = [[ParseModelUtils sharedUtilities] performBoxingIfNecessary:[object objectForKey:key]];
            [boxedDictionary setObject:boxedValue forKey:boxedKey];
        }
        boxedObject = boxedDictionary;
    }
    
    return boxedObject;
}

- (id)performUnboxingIfNecessary:(id)object targetClass:(Class)targetClass
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
    
    // Let's get recursive
    // Handle arrays and dictionaries...
    else if ([targetClass isKindOfClass:[NSArray class]]) {
        NSMutableArray *unboxedArray = [NSMutableArray array];
        for (id interalObject in object) {
            [unboxedArray addObject:[[ParseModelUtils sharedUtilities] performUnboxingIfNecessary:object targetClass:targetClass]];
        }
        unboxedObject = unboxedArray;
    }
    else if ([targetClass isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *unboxedDictionary = [NSMutableDictionary dictionary];
        NSArray *keys = [object allKeys];
        for (id key in keys) {
            id unboxedKey = [[ParseModelUtils sharedUtilities] performUnboxingIfNecessary:key targetClass:[key class]];
            id unboxedValue = [[ParseModelUtils sharedUtilities] performUnboxingIfNecessary:[object objectForKey:key]
                                                            targetClass:[[object objectForKey:key] class]];
            [unboxedDictionary setObject:unboxedValue forKey:unboxedKey];
        }
        unboxedObject = unboxedDictionary;
    }
    
    return unboxedObject;
}

@end
