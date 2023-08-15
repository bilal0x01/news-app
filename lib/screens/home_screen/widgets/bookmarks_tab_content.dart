import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/screens/home_screen/widgets/article_tile.dart';
import 'package:provider/provider.dart';

class BookmarksTabContent extends StatefulWidget {
  const BookmarksTabContent({super.key});

  @override
  State<BookmarksTabContent> createState() => _BookmarksTabContentState();
}

class _BookmarksTabContentState extends State<BookmarksTabContent> {
  List<Article>? _bookmarkedArticles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final articleProvider =
        Provider.of<ArticlesProvider>(context, listen: false);
    _bookmarkedArticles = articleProvider.bookmarkedArticles;
    if (articleProvider.articles == null) {
      articleProvider.fetchArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _bookmarkedArticles!.isEmpty
        ? const Center(
            child: Text(
            'No articles bookmarked yet!',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ))
        : ListView.builder(
            itemCount: _bookmarkedArticles!.length,
            itemBuilder: (context, index) {
              final currentArticle = _bookmarkedArticles![index];
              return Column(
                children: [
                  InkWell(
                      onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailsScreen(
                                  url: currentArticle.url!),
                            ),
                          ),
                      child: Column(
                        children: [
                          ArticleTile(
                            currentArticle: currentArticle,
                          )
                        ],
                      )),
                  const Divider(
                    thickness: 0.8,
                  ),
                ],
              );
            },
          );
  }
}
