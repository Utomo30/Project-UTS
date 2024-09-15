import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KomikCard extends GetView<HomeController> {
  final KomikModel komik;

  final void Function()? onClick;

  KomikCard({
    super.key,
    required this.komik,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          komik.assetImageUrl,
                          fit: BoxFit.cover,
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
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 4),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      komik.title,
                      style: getTextTheme(context).titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          komik.author,
                          style: getTextTheme(context)
                              .labelMedium
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Card(
                      color: getTheme(context).colorScheme.onSecondary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      margin: EdgeInsets.only(right: 16),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 12,
                        ),
                        child: Text(
                          "${komik.totalChapters} Chapter",
                          style: getTextTheme(context).labelLarge?.copyWith(
                              color: getTheme(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: getTheme(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          "${komik.rating}/5",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
