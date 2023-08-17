import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/home_screen/widgets/article_list.dart';
import 'package:provider/provider.dart';

class BookmarksTabContent extends StatelessWidget {
  const BookmarksTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkedArticles =
        Provider.of<ArticlesProvider>(context).bookmarkedArticles;

    return bookmarkedArticles!.isEmpty
        ? const Center(
            child: Text(
              'No articles bookmarked yet!',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ArticleList(
            articles: bookmarkedArticles,
            hasHeaderNews: false,
          );
  }
}
