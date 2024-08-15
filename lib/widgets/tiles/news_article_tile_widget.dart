import 'package:flutter/material.dart';
import 'package:flutternews/theme/mythemes.dart';
import 'package:flutternews/webview/article_web_view.dart';
import 'package:flutternews/widgets/helpers/button_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NewsArticleTile extends StatelessWidget {
  final String? author;
  final String? date;
  final String? title;
  final String? imageUrl;
  final String? articleUrl;

  const NewsArticleTile({
    Key? key,
    required this.author,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.articleUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 23, left: 3, right: 3),
      child: Column(
        children: [
          Row(
            children: [
              // Left part: Image
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl.toString(),
                        width: 118,
                        height: 118,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                              color: Colors.black12,
                              width: 118,
                              height: 118,
                              child: LoadingAnimationWidget.fourRotatingDots(
                                  color: Colors.black54, size: 30));
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 118,
                            height: 118,
                            color: Colors.black12,
                            child: const Icon(Icons.error_outline, size: 40),
                          );
                        },
                      )
                    : Container(
                        height: 118,
                        width: 118,
                        color: Colors.black12,
                        child: const Icon(Icons.photo, size: 40),
                      ),
              ),
              const SizedBox(width: 15),

              // Content
              SizedBox(
                width: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Author and uploading date
                    Text(
                      author != null && date != null
                          ? "${author!.length > 15 ? author!.substring(0, 15) : author}... ${date!.split("T")[0]}"
                          : "Source unknown",
                      style: MyTheme.myTheme.textTheme.displaySmall,
                    ),

                    const SizedBox(height: 3),

                    // Title of the article
                    Text(
                      title ?? "",
                      maxLines: 3,
                      style: MyTheme.myTheme.textTheme.displayMedium,
                    ),

                    const SizedBox(height: 5),

                    // Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ArticleView(articleUrl: articleUrl!,articleName: author.toString(),)));
                          },
                          height: 36,
                          width: 129.62,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Separator line
          Container(
            margin: const EdgeInsets.only(top: 23),
            color: Colors.black26,
            width: double.maxFinite,
            height: 0.5,
          ),
        ],
      ),
    );
  }
}
