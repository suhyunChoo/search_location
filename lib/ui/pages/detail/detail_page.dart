import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailPage extends StatelessWidget {
  String link;

  DetailPage(this.link);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(link),
      ),
      body: SizedBox(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(link)),
          // initialSettings: InAppWebViewSettings(
          //   useWideViewPort: true,
          //   javaScriptEnabled: true,
          //   cacheEnabled: false,
          //   userAgent: "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/537.36",
          // ),
        ),
      ),
    );
  }
}
