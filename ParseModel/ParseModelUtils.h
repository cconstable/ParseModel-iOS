//
//  ParseModelUtils.h
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/26/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseModelUtils : NSObject

+ (instancetype)sharedUtilities;

/**
 This is called by the Parse Models to register themselves.
 
 Registered Parse Models help Parse Model know what kind of class to instantiate
 when doing things like unboxing array/dictionary values from the backend.
 Registering your Parse Models on start-up is highly recommended. If you don't,
 bad things may happen.
 */
- (BOOL)registerParseModel:(Class)parseModelClass;

// Generic boxing/unboxing methods.
- (id)performBoxingIfNecessary:(id)object;
- (id)performUnboxingIfNecessary:(id)object
                     targetClass:(Class)targetClass;

/** 
 Attempts to resolve the type Class this object represents in the context
 of this app. Usually, 'object' parameter will be of type PFObject and
 ParseModelUtils will use the registered Parse Models to find the right
 Class.
*/
- (Class)resolveModelClassForObject:(id)object;

@end
