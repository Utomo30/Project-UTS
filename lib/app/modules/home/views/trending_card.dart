import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TrendingCard extends GetView<HomeController> {
  final KomikModel komik;

  TrendingCard({
    required this.komik,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: InkWell(
        onTap: () => controller.openDetail(context, komik),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover Image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        komik.assetImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Text('Image not available'));
                        },
                      ),
                    ),
                    if (komik.isPremium)
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: getTheme(context).colorScheme.secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Icon(
                          Icons.star,
                          color: getTheme(context).colorScheme.onSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              // Manga Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  komik.title,
                  overflow: TextOverflow.ellipsis,
                  style: getTextTheme(context).titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              // Author
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'By ${komik.author}',
                  overflow: TextOverflow.ellipsis,
                  style: getTextTheme(context).labelMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
