//
//  RNHello.m
//  bridgeTest
//
//  Created by 조정은 on 2021/11/09.
//
#import <React/RCTLog.h>
#import "RNHello.h"

@implementation RNHello

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
  callback(@[@"hello from native ios"]);
}


//function with NSDictionary params
//object 형식으로 받기
RCT_EXPORT_METHOD(doTask2:(NSString *)taskName params:(NSDictionary *)params)
{
  RCTLogInfo(@"Do task with params = %@", params);
}


//object array 방식으로 callback 보내기
RCT_EXPORT_METHOD(getAllTasks: (RCTResponseSenderBlock)callback) {
  NSArray *tasks = @[
    @{@"name": @"buy a new car",
      @"finishedDate": @"20-10-2022"},
    @{@"name": @"buy a new house",
      @"finishedDate": @"20-10-2022"}];
  
  //없게 만들어본다면?
  //tasks = nil;
  //callback successful
  if(tasks){
    //만약 tasks가 [NSNull null]의 형태로 되어 있다면,
    callback(@[[NSNull null], tasks]);
  } else {
    //없다면 error라면,
    callback(@[@"Cannot find tasks", [NSNull null]]);
  }
}


// function with "promise"
RCT_REMAP_METHOD(getSomeTasks, params:(NSString*)params
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
                 )
{
  NSArray * tasks = @[
    @{@"name": @"buy a new car",
      @"finishedDate": @"20-10-2022"},
    @{@"name": @"buy a new house",
      @"finishedDate": @"20-10-2022"}];
  
  //input param이 "all"이라면
  if([params isEqualToString:@"all"]) {
    resolve(tasks);
  } else {
    NSString * code = @"500";
    NSString * message = @"cannot get tasks, internal error";
    NSError * error = [NSError errorWithDomain:@"Internal error"
                               code:500
                               userInfo:@{NSLocalizedDescriptionKey: @"Something wrong with tasks"}];
    
    reject(code, message, error);
    
  }
}



@end
