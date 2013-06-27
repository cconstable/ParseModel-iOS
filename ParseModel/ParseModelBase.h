//
//  ParseModelBase.h
//  ParseModel
//
//  Parse Adaptation:
//  Created by Christopher Constable on 6/3/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//
//  Original Code:
//  Created by Jens Alfke on 8/26/11.
//  Copyright (c) 2011 Couchbase, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface ParseModelBase : NSObject

+ (instancetype)parseModel;

// Override these methods to perform additional boxing/unboxing.
- (id)performBoxingIfNecessary:(id)object;
- (id)performUnboxingIfNecessary:(id)object targetClass:(Class)targetClass;

@end
