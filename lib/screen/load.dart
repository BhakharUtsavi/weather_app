import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:wallpapar/provider/web_provider.dart';

class Load extends StatefulWidget {
  const Load({super.key});

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(onRefresh: () async {
      WebUri? webUri = await inAppWebViewController?.getUrl();
      inAppWebViewController?.loadUrl(urlRequest: URLRequest(url: webUri));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String url=ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Consumer<WebProvider>(builder: (context, value, child) {
            if (value.progress >= 1) {
              return SizedBox.shrink();
            }
            return LinearProgressIndicator(
              value: value.progress,
            );
          }),
          Expanded(
              child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(url)),
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            onLoadStop: (controller, url) {
              pullToRefreshController?.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              if (progress >= 100) {
                pullToRefreshController?.endRefreshing();
              }
              Provider.of<WebProvider>(context, listen: false)
                  .onChangeProgress(progress);
            },
            pullToRefreshController: pullToRefreshController,
          ))
        ],
      ),
    );
  }
}
