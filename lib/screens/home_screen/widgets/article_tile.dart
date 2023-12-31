import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/screens/home_screen/widgets/tile_actions_row.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_spaces.dart';
import 'package:news_app/widgets/design/app_cache_network_image.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.currentArticle,
  });

  final Article currentArticle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  currentArticle.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                AppSpaces.vertSpace1,
                TileActionsRow(
                  currentArticle: currentArticle,
                  iconsSize: 26,
                  contentColor: AppColors.subtleColor,
                )
              ],
            ),
          ),
          AppSpaces.horzSpace3,
          SizedBox(
            width: 120,
            height: 100,
            child: currentArticle.urlToImage == null
                ? Image.asset(ConstantAssets.placeholderImg)
                : AppCacheNetworkImage(imageUrl: currentArticle.urlToImage!),
          ),
        ],
      ),
    );
  }
}
