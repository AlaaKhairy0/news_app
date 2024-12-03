import 'article.dart';

class ArticlesResponse {
  String? status;
  String? message;
  String? code;
  num? totalResults;
  List<Article>? articles;

  ArticlesResponse({
    this.status,
    this.code,
    this.message,
    this.totalResults,
    this.articles,
  });

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
