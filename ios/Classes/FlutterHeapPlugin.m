#import "FlutterHeapPlugin.h"
#import "Heap.h"

@implementation FlutterHeapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_heap"
            binaryMessenger:[registrar messenger]];
  FlutterHeapPlugin* instance = [[FlutterHeapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([call.method isEqualToString:@"track"]) {
    NSString* type = call.arguments[@"type"];
    NSDictionary* props = call.arguments[@"properties"];
    [Heap track:type withProperties:props];
  } else if ([call.method isEqualToString:@"identify"]) {
    NSString* identity = call.arguments[@"identity"];
    [Heap identify:identity];
  } else if ([call.method isEqualToString:@"resetIdentity"]) {
    [Heap resetIdentity];
  } else if ([call.method isEqualToString:@"addUserProperties"]) {
    NSDictionary* props = call.arguments[@"properties"];
    [Heap addUserProperties:props];
  } else if ([call.method isEqualToString:@"addEventProperties"]) {
    NSDictionary* props = call.arguments[@"properties"];
    [Heap addEventProperties:props];
  } else if ([call.method isEqualToString:@"removeEventProperty"]) {
    NSString* property = call.arguments[@"property"];
    [Heap removeEventProperty:property];
  } else if ([call.method isEqualToString:@"clearEventProperties"]) {
    [Heap clearEventProperties];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
