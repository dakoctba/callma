import 'package:callma/ui/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewView extends StatelessWidget {
  final String _title;
  final String _url;

  WebviewView(this._title, this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title),
      body: WebView(
        initialUrl: _url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
