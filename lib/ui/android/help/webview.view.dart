import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewView extends StatelessWidget {
  final String _url;

  WebviewView(this._url);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
