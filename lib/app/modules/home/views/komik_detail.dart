import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KomikDetail extends StatelessWidget {
  final KomikModel komik;

  KomikDetail({
    super.key,
    required this.komik,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            komik.title,
            style: getTheme(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8),

          // Subtitle
          Text(
            komik.subtitle,
            style: getTheme(context).textTheme.titleMedium,
          ),
          SizedBox(height: 16),

          // Genres
          Text(
            komik.getGenresString(),
          ),
          SizedBox(height: 8),

          // Author
          Text(
            'Author: ${komik.author}',
          ),
          SizedBox(height: 16),

          // Chapter List
          Text(
            'Chapters',
            style: getTheme(context).textTheme.titleMedium,
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                komik.totalChapters, // Number of chapters
                (index) => ListTile(
                  leading: Icon(Icons.document_scanner),
                  title: Text('Chapter ${komik.totalChapters - index}'),
                  onTap: () {
                    // Handle chapter tap
                    Get.toNamed(Routes.DETAIL_KOMIK,
                        arguments: [komik, komik.totalChapters - index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
