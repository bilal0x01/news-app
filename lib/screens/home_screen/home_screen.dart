import 'package:flutter/material.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/screens/home_screen/widgets/article_tile.dart';
import 'package:news_app/screens/home_screen/widgets/bookmarks_tab_content.dart';
import 'package:news_app/screens/home_screen/widgets/header_news_card.dart';
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
            bottom: const TabBar(
              isScrollable: true,
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
              dividerColor: AppColors.subtleColor,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Home'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Tech News'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Bookmarks'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            articles == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return HeaderNewsCard(currentArticle: articles[0]);
                      }
                      final currentArticle = articles[index];
                      return Column(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ArticleDetailsScreen(
                                              url: currentArticle.url!),
                                    ),
                                  ),
                              child: Column(
                                children: [
                                  if (index == 1)
                                    Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      child: const Text('Recent',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Inter',
                                          )),
                                    ),
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
            const TechnologyTabContent(),
            const BookmarksTabContent(),
          ]),
          floatingActionButton: const ToggleThemeFab(),
        ),
      ),
    );
  }
}
