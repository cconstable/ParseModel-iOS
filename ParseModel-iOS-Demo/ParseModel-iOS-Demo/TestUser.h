//
//  TestUser.h
//  ParseModel-iOS-Demo
//
//  Created by Christopher Constable on 6/4/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "ParseModelUser.h"
#import "TestObject.h"

@interface TestUser : ParseModelUser

// Simply declare your properties like usual...
@property (nonatomic, strong) NSString *userFullName;
@property (nonatomic) NSInteger userAge;
@property (nonatomic, strong) TestObject *someObject;

@end
