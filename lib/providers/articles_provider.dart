import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news/articles_data_provider.dart';

class ArticlesProvider with ChangeNotifier {
  List<Article>? _articles;

  List<Article>? get articles => _articles;
  List<Article>? get bookmarkedArticles =>
      _articles?.where((article) => article.isBookmark == true).toList();

  fetchArticles() async {
    _articles = await ArticlesDataProvider.fetchArticles();
    notifyListeners();
  }
}
