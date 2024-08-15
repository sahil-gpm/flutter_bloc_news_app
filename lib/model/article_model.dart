class ArticleModel {
  final String? source;
  final String? author;
  final String? title;
  final String? description;
  final String? articleUrl;
  final String? imageUrl;
  final String? publishedAt;
  final String? content;

  ArticleModel(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.articleUrl,
      required this.imageUrl,
      required this.publishedAt,
      required this.content});
}
