//
//  ParseModelUtils.h
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/26/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseModelUtils : NSObject

// Generic boxing/unboxing methods.
+ (id)performBoxingIfNecessary:(id)object;
+ (id)performUnboxingIfNecessary:(id)object
                     targetClass:(Class)targetClass;

@end
