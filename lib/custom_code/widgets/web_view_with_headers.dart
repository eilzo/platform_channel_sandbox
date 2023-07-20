// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebViewWithHeaders extends StatefulWidget {
  const WebViewWithHeaders({
    Key? key,
    this.width,
    this.height,
    required this.url,
    this.horizontalScroll = false,
    this.verticalScroll = false,
    required this.token,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String url;
  final bool horizontalScroll;
  final bool verticalScroll;
  final String token;

  @override
  _WebViewWithHeadersState createState() => _WebViewWithHeadersState();
}

class _WebViewWithHeadersState extends State<WebViewWithHeaders> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WebViewX(
        key: webviewKey,
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        ignoreAllGestures: false,
        initialContent: widget.url,
        initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.requireUserActionForAllMediaTypes,
        initialSourceType: SourceType.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webviewController = controller;
          webviewController.loadContent(widget.url,
              headers: {'Authorization': 'Bearer ' + widget.token});
        },
        webSpecificParams: const WebSpecificParams(
          webAllowFullscreenContent: true,
        ),
        mobileSpecificParams: MobileSpecificParams(
          debuggingEnabled: false,
          gestureNavigationEnabled: true,
          mobileGestureRecognizers: {
            if (widget.verticalScroll)
              Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer(),
              ),
            if (widget.horizontalScroll)
              Factory<HorizontalDragGestureRecognizer>(
                () => HorizontalDragGestureRecognizer(),
              ),
          },
          androidEnableHybridComposition: true,
        ),
      );

  Key get webviewKey => Key(
        [
          widget.url,
          widget.width,
          widget.height,
          widget.horizontalScroll,
          widget.verticalScroll,
        ].map((s) => s?.toString() ?? '').join(),
      );
}
