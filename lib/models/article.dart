import 'package:flutter/material.dart';

class Article with ChangeNotifier {
  late final String title;
  late final String url;
  late final String publishedAt;

  late final String? author;
  late final String? description;
  late final String? urlToImage;
  late final String? content;
  bool isBookmark = false;
  late final VoidCallback? onBookmarkChanged;

  Article({
    required this.title,
    required this.url,
    required this.publishedAt,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.content,
    required this.isBookmark,
    this.onBookmarkChanged,
  });

  Article.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }

  void toggleBookmarkStatus() {
    isBookmark = !isBookmark;
    onBookmarkChanged!();
    notifyListeners();
  }
}
