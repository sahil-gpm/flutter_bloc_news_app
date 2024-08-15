import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:flutternews/widgets/components/bottom_navigation_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String articleUrl;
  final String articleName;
  const ArticleView({super.key, required this.articleUrl, required this.articleName});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.articleUrl.toString()));

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //normal text
              const Text(
                "Flutter",
                style: TextStyle(
                    letterSpacing: -.5,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
              ),

              //gradient text
              GradientText("News",
                  style: const TextStyle(
                    letterSpacing: -.5,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [
                    MyTheme.myTheme.colorScheme.primary,
                    MyTheme.myTheme.colorScheme.secondary,
                    MyTheme.myTheme.colorScheme.tertiary,
                  ])
            ],
          ),
          centerTitle: false,
          elevation: .1,
          actions: [
            IconButton(onPressed: ()async{
              await Share.share('Read the article : ${widget.articleName}\n Link : ${widget.articleUrl}');
            }, icon: const Icon(CupertinoIcons.share)),
            IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.heart))
          ],
          bottom: const PreferredSize(preferredSize: Size(0, 6), child: SizedBox()),
        ),

        bottomNavigationBar: const BottomNavigation(),
        body: WebViewWidget(
          controller: controller,
        ));
  }
}
