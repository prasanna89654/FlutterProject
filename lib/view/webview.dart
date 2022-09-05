import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';

class WebviewScreen extends StatelessWidget {
  final String? url;
  const WebviewScreen({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // centerTitle: true,
        title: Text("Go Back"),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
