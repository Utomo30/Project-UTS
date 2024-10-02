import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KomikDetail extends StatelessWidget {
  final KomikModel komik;

  const KomikDetail({
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
            style: TextStyle(
              fontSize: 24, // Ukuran font yang lebih besar
              fontWeight: FontWeight.bold, // Berat font bold
              color: Theme.of(context).colorScheme.primary, // Warna sesuai tema
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            komik.subtitle,
            style: TextStyle(
              fontSize: 18, // Ukuran font subtitle
              color:
                  Theme.of(context).colorScheme.secondary, // Warna sesuai tema
            ),
          ),
          const SizedBox(height: 16),

          // Genres
          Text(
            komik.getGenresString(),
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic, // Italic untuk gaya
              color: Colors.grey[700], // Warna yang lebih soft
            ),
          ),
          const SizedBox(height: 8),

          // Author
          Text(
            'Author: ${komik.author}',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800], // Warna author
            ),
          ),
          const SizedBox(height: 16),

          // Chapter List
          Text(
            'Chapters',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // Bold untuk judul chapter
              color: Theme.of(context).colorScheme.primary, // Warna sesuai tema
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: List.generate(
                komik.totalChapters, // Number of chapters
                (index) => Card(
                  // Menggunakan Card untuk chapter
                  margin: const EdgeInsets.symmetric(
                      vertical: 4), // Margin antar chapter
                  child: ListTile(
                    leading: const Icon(Icons.document_scanner),
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
          ),
        ],
      ),
    );
  }
}
