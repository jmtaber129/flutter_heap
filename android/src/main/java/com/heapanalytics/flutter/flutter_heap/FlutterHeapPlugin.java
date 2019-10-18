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
    if (call.method.equals("track")) {
      String event = call.argument("type");
      Map<String, String> props = call.argument("properties");
      Heap.track(event, props);
    } else {
      result.notImplemented();
    }
  }
}
