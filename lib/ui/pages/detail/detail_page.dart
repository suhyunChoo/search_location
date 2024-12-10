import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

//연결된 링크 인앱웹뷰 통해 보여주는 페이지

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
        ),
      ),
    );
  }
}
