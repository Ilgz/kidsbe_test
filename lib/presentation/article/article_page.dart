import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/presentation/core/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends StatelessWidget {
   ArticlePage({Key? key, required this.articleLink}) : super(key: key);
  final String articleLink;
  late final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  return NavigationDecision.navigate;
  },
  ),
  )
  ..loadRequest(Uri.parse(articleLink));
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: true,
       body:WebViewWidget(
         controller: controller,
       ),
    );
  }
}
