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
}
