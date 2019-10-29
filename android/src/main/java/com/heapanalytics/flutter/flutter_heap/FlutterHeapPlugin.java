package com.heapanalytics.flutter.flutter_heap;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.Map;

import com.heapanalytics.android.Heap;

/** FlutterHeapPlugin */
public class FlutterHeapPlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_heap");
    channel.setMethodCallHandler(new FlutterHeapPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    switch (call.method) {
      case "track": {
        String event = call.argument("type");
        Map<String, String> props = call.argument("properties");
        Heap.track(event, props);
        break;
      }
      case "identify": {
        String identity = call.argument("identity");
        Heap.identify(identity);
        break;
      }
      case "resetIdentity": {
        Heap.resetIdentity();
        break;
      }
      case "addUserProperties": {
        Map<String, String> props = call.argument("properties");
        Heap.addUserProperties(props);
        break;
      }
      case "addEventProperties": {
        Map<String, String> props = call.argument("properties");
        Heap.addEventProperties(props);
        break;
      }
      case "removeEventProperty": {
        String property = call.argument("property");
        Heap.removeEventProperty(property);
        break;
      }
      case "clearEventProperties": {
        Heap.clearEventProperties();
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }
}
