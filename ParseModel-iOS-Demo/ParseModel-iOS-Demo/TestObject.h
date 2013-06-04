//
//  TestObject.h
//  ParseModel
//
//  Created by Christopher Constable on 6/3/13.
//  Copyright (c) 2013 Futura IO. All rights reserved.
//

#import "ParseModel.h"

@interface TestObject : ParseModel

// Simply declare your properties like usual... 
@property (nonatomic, strong) NSString *someString;
@property (nonatomic, strong) NSString *someOtherString;
@property (nonatomic) NSInteger anInteger;
@property (nonatomic, strong) NSDate *aDate;

@end
