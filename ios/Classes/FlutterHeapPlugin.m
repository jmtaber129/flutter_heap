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
  if ([@"track" isEqualToString:call.method]) {
    NSString* type = call.arguments[@"type"];
    NSObject* props = call.arguments[@"properties"];
    [Heap track:type withProperties:props];
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
