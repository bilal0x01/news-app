import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final String url;

  const ArticleDetailsScreen({super.key, required this.url});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
