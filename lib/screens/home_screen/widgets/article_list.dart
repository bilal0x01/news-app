import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/screens/home_screen/widgets/article_tile.dart';
import 'package:news_app/screens/home_screen/widgets/header_news_card.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({
    super.key,
    required this.articles,
    required this.hasHeaderNews,
  });

  final List<Article>? articles;
  final bool hasHeaderNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles!.length,
      itemBuilder: (context, index) {
        if (index == 0 && hasHeaderNews) {
          return HeaderNewsCard(currentArticle: articles![0]);
        }
        final currentArticle = articles![index];
        return Column(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      ArticleDetailsScreen(url: currentArticle.url),
                ),
              ),
              child: Column(
                children: [
                  if (index == 1 && hasHeaderNews)
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.centerLeft,
                      height: 60,
                      child: const Text(
                        'Recent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ArticleTile(
                    currentArticle: currentArticle,
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.8),
          ],
        );
      },
    );
  }
}
