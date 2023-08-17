import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class AppCacheNetworkImage extends StatelessWidget {
  const AppCacheNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SizedBox(
          width: 25,
          height: 25,
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          Image.asset(ConstantAssets.placeholderImg),
    );
  }
}
