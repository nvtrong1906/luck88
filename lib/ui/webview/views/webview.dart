import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../utils/color.dart';
import '../../../utils/constant.dart';
import '../../../utils/utils.dart';
import '../../home/controllers/home_controller.dart';


class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams())
      ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (_) => setState(() {
                isLoading = false;
              })))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        // title: const Text('Luck88'),
      // ),
      body: Stack(children: [
        WebViewWidget(
          controller: controller,
        ),
        if (isLoading) const Center(child: CircularProgressIndicator())
      ]),
    );
  }
}
