import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/theme/app_spaces.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:share_plus/share_plus.dart';

class TileActionsRow extends StatefulWidget {
  const TileActionsRow({
    super.key,
    required this.currentArticle,
    required this.iconsSize,
    required this.contentColor,
  });

  final Article currentArticle;
  final double iconsSize;
  final Color contentColor;

  @override
  State<TileActionsRow> createState() => _TileActionsRowState();
}

class _TileActionsRowState extends State<TileActionsRow> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.currentArticle.publishedAt!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.currentArticle.toggleBookmarkStatus();
            });
          },
          child: Icon(
            widget.currentArticle.isBookmark!
                ? Icons.bookmark
                : Icons.bookmark_border_rounded,
            size: widget.iconsSize,
            color: widget.contentColor,
          ),
        ),
        AppSpaces.horzSpace1,
        InkWell(
          onTap: () {
            Share.share(widget.currentArticle.url!);
          },
          child: FaIcon(
            Icons.file_upload_outlined,
            size: widget.iconsSize,
            color: widget.contentColor,
          ),
        ),
        AppSpaces.horzSpace1,
        Text(
          timeago.format(DateTime.parse(widget.currentArticle.publishedAt!)),
          style: TextStyle(
            color: widget.contentColor,
          ),
        ),
      ],
    );
  }
}
