import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/screens/home_screen/widgets/article_tile.dart';
import 'package:provider/provider.dart';

class TechnologyTabContent extends StatefulWidget {
  const TechnologyTabContent({super.key});

  @override
  State<TechnologyTabContent> createState() => _TechnologyTabContentState();
}

class _TechnologyTabContentState extends State<TechnologyTabContent> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final articleProvider =
        Provider.of<ArticlesProvider>(context, listen: false);
    if (articleProvider.techArticles == null) {
      articleProvider.fetchTechArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final technologyArticles =
        Provider.of<ArticlesProvider>(context).techArticles;
    return Scaffold(
      body: technologyArticles == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: technologyArticles.length,
              itemBuilder: (context, index) {
                final currentArticle = technologyArticles[index];
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
            ),
    );
  }
}
