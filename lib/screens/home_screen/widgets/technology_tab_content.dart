import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/home_screen/widgets/article_list.dart';
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
          : ArticleList(
              articles: technologyArticles,
              hasHeaderNews: false,
            ),
    );
  }
}
