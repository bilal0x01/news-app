import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/home_screen/widgets/article_list.dart';
import 'package:news_app/screens/home_screen/widgets/bookmarks_tab_content.dart';
import 'package:news_app/screens/home_screen/widgets/technology_tab_content.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/widgets/design/toggle_theme_fab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final articleProvider =
        Provider.of<ArticlesProvider>(context, listen: false);

    if (articleProvider.articles == null) {
      articleProvider.fetchArticles();
    }
  }

  final tabs = [
    'Home',
    'Tech News',
    'Bookmarks',
  ];

  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<ArticlesProvider>(context).articles;
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'THE BALL STREET JOURNAL',
              style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                fontSize: 26,
                letterSpacing: -1,
                decoration: TextDecoration.underline,
              ),
            ),
            bottom: TabBar(
              dividerColor: AppColors.subtleColor,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              tabs: tabs
                  .map(
                    (tabName) => Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(tabName),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(children: [
            articles == null
                ? const Center(child: CircularProgressIndicator())
                : ArticleList(articles: articles, hasHeaderNews: true),
            const TechnologyTabContent(),
            const BookmarksTabContent(),
          ]),
          floatingActionButton: const ToggleThemeFab(),
        ),
      ),
    );
  }
}
