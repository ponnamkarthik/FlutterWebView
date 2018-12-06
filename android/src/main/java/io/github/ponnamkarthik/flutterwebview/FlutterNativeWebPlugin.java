package io.github.ponnamkarthik.flutterwebview;

import io.flutter.plugin.common.PluginRegistry.Registrar;

public class FlutterNativeWebPlugin {

  public static void registerWith(Registrar registrar) {
    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "ponnamkarthik/flutterwebview", new FlutterwebviewFactory(registrar));
  }
}
