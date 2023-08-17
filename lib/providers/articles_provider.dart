import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/news/articles_data_provider.dart';

class ArticlesProvider with ChangeNotifier {
  List<Article>? _articles;

  List<Article>? get articles => _articles;

  fetchArticles() async {
    _articles = await ArticlesDataProvider.fetchArticles();
    for (var article in _articles!) {
      article.onBookmarkChanged = () {
        notifyListeners();
      };
    }
    notifyListeners();
  }

  List<Article>? _techArticles;

  List<Article>? get techArticles => _techArticles;

  fetchTechArticles() async {
    _techArticles = await ArticlesDataProvider.fetchTechArticles();
    for (var article in _techArticles!) {
      article.onBookmarkChanged = () {
        notifyListeners();
      };
    }
    notifyListeners();
  }

  List<Article>? get bookmarkedArticles {
    List<Article> allBookmarkedArticles = [];

    if (_articles != null) {
      allBookmarkedArticles
          .addAll(_articles!.where((article) => article.isBookmark == true));
    }
    if (_techArticles != null) {
      allBookmarkedArticles.addAll(
          _techArticles!.where((article) => article.isBookmark == true));
    }

    return allBookmarkedArticles;
  }
}
