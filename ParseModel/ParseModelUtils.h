//
//  ParseModelUtils.h
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/26/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseModelUtils : NSObject

/**
 Registered Parse Models help Parse Model know what kind of class to instantiate
 when doing things like unboxing array/dictionary values from the backend. 
 Registering your Parse Models on start-up is highly recommended. If you don't,
 bad things may happen.
 */
@property (nonatomic, strong) NSMutableDictionary *registeredParseModels;

+ (instancetype)sharedUtilities;

// Generic boxing/unboxing methods.
- (id)performBoxingIfNecessary:(id)object;
- (id)performUnboxingIfNecessary:(id)object
                     targetClass:(Class)targetClass;

@end
