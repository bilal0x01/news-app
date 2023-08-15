import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/article_details_screen/article_details_screen.dart';
import 'package:news_app/screens/home_screen/widgets/tile_actions.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_spaces.dart';

class HeaderNewsCard extends StatelessWidget {
  const HeaderNewsCard({super.key, required this.currentArticle});
  final Article currentArticle;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ArticleDetailsScreen(url: currentArticle.url!),
        ),
      ),
      child: Material(
        elevation: isDarkMode ? 0 : 20,
        child: Stack(children: [
          Positioned.fill(
            child: Image.network(
              currentArticle.urlToImage!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDarkMode
                        ? Theme.of(context).colorScheme.background
                        : AppColors.primaryColor,
                    Colors.black.withOpacity(0.6)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  child: Text(
                    currentArticle.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.subtleColor2,
                    ),
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
                AppSpaces.vertSpace1,
                TileActions(
                  currentArticle: currentArticle,
                  iconsSize: 34,
                  contentColor: AppColors.subtleColor2,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
