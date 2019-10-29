import 'dart:async';

import 'package:flutter/services.dart';

class FlutterHeap {
  static const MethodChannel _channel =
      const MethodChannel('flutter_heap');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> track(String event, Map<String, String> properties) async {
    await _channel.invokeMethod('track', <String, dynamic>{
      'type': event,
      'properties': properties,
    });
  }

  static Future<void> identify(String identity) async {
    await _channel.invokeMethod('identify', <String, dynamic>{
      'identity': identity,
    });
  }

  static Future<void> resetIdentity() async {
    await _channel.invokeMethod('resetIdentity');
  }

  static Future<void> addUserProperties(Map<String, String> properties) async {
    await _channel.invokeMethod('addUserProperties', <String, dynamic>{
      'properties': properties,
    });
  }

  static Future<void> addEventProperties(Map<String, String> properties) async {
    await _channel.invokeMethod('addEventProperties', <String, dynamic>{
      'properties': properties,
    });
  }

  static Future<void> removeEventProperty(String property) async {
    await _channel.invokeMethod('removeEventProperty', <String, dynamic>{
      'property': property,
    });
  }

  static Future<void> clearEventProperties() async {
    await _channel.invokeMethod('resetIdentity');
  }
}
