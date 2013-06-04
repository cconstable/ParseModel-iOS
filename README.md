ParseModel-iOS
==============

Hassel-free data models for the Parse iOS SDK.

## Why ParseModel?

[Parse](https://parse.com/) is a cloud backend as-a-service (or BaaS) that allows developers to quickly get their apps up and running with little or no backend setup.

More often than not, we developers like to work with out own classes and not use the out-of-the-box data models that come with many of these services. Regardless of our approach there comes a time when we need to map the properties of our objects to the backend object. Sometimes we accomplish this by overriding the getters and setters of our properties like this:

```
@interface MyObject : NSObject

@property (nonatomic, strong) NSString *someString;
@property (nonatomic, strong) PFObject *parseObject;

@end


@implementation MyObject

- (NSString *)someString
{
    return [self.parseObject objectForKey:kSomeStringKey];
}

- (NSString *)setSomeString:(NSString *)someString
{
    [self.parseObject setObject:someString forKey:kSomeStringKey];
}

@end
```

The benefits to this approach is that we can define an Objective-C `protocol` to house these properties and have our model objects conform to this protocol:

```
@interface MyObject : NSObject <MyObjectProtocol>
@property (nonatomic, strong) PFObject *parseObject;
@end
```

Now in our app code, we can just deal with `id<MyObjectProtocol>` pointers instead of worrying about specifics. The benefits of this are pretty obvious…

1. We have a relatively static interface for dealing with our data (i.e. the backend can change as much as it wants and the majority of our code stays the same).
2. We can transparently use objects that connect to different backends and services together.
3. You get it.

Setting up models like this, however, can be time consuming. Nobody likes typing out getters/setters, creating lots of static keys, etc. 

This is where ParseModel comes in.


## What does ParseModel do?

#### Using ParseModel

Parse Model was based off an idea from [CouchCocoa](https://github.com/couchbaselabs/CouchCocoa) where to create a model object all you would need to do is create some `properties` and set them as `dynamic`. That's it. In our case, all of our `properties` get mapped to an underlying `PFObject` as values with the same key.

Here's an example:


```
@interface MyObject : ParseModel

@property (nonatomic, strong) NSString *someString;
@property (nonatomic, strong) NSString *someOtherString;

@end


@implementation MyObject

@dynamic someString;
@dynamic someOtherString;

+ (NSString *)parseModelClass
{
    return @"MyObject";
}

@end
``` 

Afer declaring the `MyObject` class above we can do things like this:

```
MyObject *myObject = [[MyObject alloc] init];
myObject.someString = @"Hello there";
[myObject.parseObject saveInBackground];
```

When `someString` is set it is automatically mapped to the underlying `PFObject`.

Lastly, you can created models with the following ParseModel method:

```
+ (id)modelWithParseObject:(PFObject *)parseObject;
```

## Installing

I've created a [CocoaPods](http://cocoapods.org/) podspec here but some of the dependencies seem to be acting up at the moment. Seems like an small outage on Github's side. When I'm able to test I'll push the podspec to the specs repo. For now, just copy the files in the **ParseModel** folder into your project.

## Limitations

ParseModel currently works with all types that `PFObject` [supports](https://parse.com/docs/ios_guide#objects-types/iOS). This means don't try using a UIImage and expect it to work! If you need to store UIImage data (or something that is unsupported) you have a few alternatives:

1. Don't declare the `property` as `dynamic` and write your own code to handle that particular `property`.
2. Use `PFFile`.
3. Fork this repo and add support for serializing your object type to JSON :)

## How does this work?

First off, let me say that this probably wouldn't have happened if it wasn't for [Jens Alfke](https://github.com/snej). He wrote almost all of this code. I simply adapted it for Parse. Most of the code was pulled from his CouchModel class.

Under the hood, when a property is accessed that has not been created (because of the `dynamic` keyword in our case), we catch a last-ditch message to our class that says: "Hey, we couldn't find this instance method". If we can detect that it is a setter or getter method for a property that was declared as dynamic, we then create the getter/setter on the fly using a pre-defined block of code that uses a `PFObject` to store/retrieve the values. That's the gist. Check out [Dynamic Method Resolution](https://developer.apple.com/library/ios/#documentation/cocoa/conceptual/ObjCRuntimeGuide/Articles/ocrtDynamicResolution.html) for more information.

## License

The original code Jens wrote was released under the [Apache license, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).
