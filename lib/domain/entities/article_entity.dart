import 'package:news_app/domain/entities/source_entity.dart';

class ArticleEntity {
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  SourceEntity? source;

  ArticleEntity(
      {this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});
}
