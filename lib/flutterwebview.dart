import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


export 'dart:async';

typedef void WebViewCreatedCallback(WebController controller);

class FlutterWebView extends StatefulWidget {

  const FlutterWebView({
    Key key,
    @required this.onWebCreated,
  }) : super(key: key);

  final WebViewCreatedCallback onWebCreated;


  @override
  State createState() => new _FlutterWebViewState();
}

class _FlutterWebViewState extends State<FlutterWebView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {

      return AndroidView(
        viewType: 'ponnamkarthik/flutterwebview',
        onPlatformViewCreated: onPlatformCreated,
//        creationParamsCodec: const StandardMessageCodec(),
//        gestureRecognizers: [new VerticalDragGestureRecognizer(), new HorizontalDragGestureRecognizer(), new TapGestureRecognizer()],
      );
    }

    return new Text(
        '$defaultTargetPlatform is not yet supported by the maps plugin');
  }

  Future<void> onPlatformCreated(id)  async {
    if (widget.onWebCreated == null) {
      return;
    }
    widget.onWebCreated(new WebController.init(id));
  }
}


class WebController {

  WebController.
      init(int id) {
        _channel = new MethodChannel('ponnamkarthik/flutterwebview_$id');
        _pageFinsihed = EventChannel('ponnamkarthik/flutterwebview_stream_pagefinish_$id');
        _pageStarted = EventChannel('ponnamkarthik/flutterwebview_stream_pagestart_$id');
      }

  MethodChannel _channel;
  EventChannel _pageFinsihed;
  EventChannel _pageStarted;

  Future<void> loadUrl(String url) async {
    assert(url != null);
    return _channel.invokeMethod('loadUrl', url);
  }

  Future<void> loadData(String html) async {
    assert(html != null);
    return _channel.invokeMethod('loadData', html);
  }

  Stream<String> get onPageFinished {
    var url = _pageFinsihed
        .receiveBroadcastStream()
        .map<String>(
            (element) => element);
    return url;
  }

  Stream<String> get onPageStarted {
    var url = _pageStarted
        .receiveBroadcastStream()
        .map<String>(
            (element) => element);
    return url;
  }
}
