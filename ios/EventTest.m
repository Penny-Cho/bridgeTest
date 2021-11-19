//
//  EventTest.m
//  bridgeTest
//
//  Created by 조정은 on 2021/11/19.
//

#import "EventTest.h"

@implementation EventTest

//constructor as "Singleton pattern" = 1
//class EventTest => 1 object EventTask
+(id)allocWithZone:(NSZone *)zone
{
  static EventTest *shared = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shared = [super allocWithZone:<#zone#>];
  });
  return shared;
};


RCT_EXPORT_MODULE();

// send some events from objC to React native
- (NSArray<NSString *> *) supportedEvents {
  return @[@"EventA", @"EventB"];
  
}



@end
