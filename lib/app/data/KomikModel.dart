class KomikModel {
  final String title;
  final String subtitle;
  final List<String> genres;
  final int totalChapters;
  final String author;
  final String assetImageUrl;
  final bool isPremium;
  final double rating;

  // Constructor
  KomikModel({
    required this.title,
    required this.subtitle,
    required this.genres,
    required this.totalChapters,
    required this.author,
    required this.assetImageUrl,
    required this.isPremium,
    required this.rating,
  });

  // Method to convert KomikModel to a Map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'genres': genres,
      'totalChapters': totalChapters,
      'author': author,
      'assetImageUrl': assetImageUrl,
      'isPremium': isPremium,
      'rating': rating,
    };
  }

  // Method to create a KomikModel from a Map (useful for deserialization)
  factory KomikModel.fromMap(Map<String, dynamic> map) {
    return KomikModel(
      title: map['title'],
      subtitle: map['subtitle'],
      genres: List<String>.from(map['genres']),
      totalChapters: map['totalChapters'],
      author: map['author'],
      assetImageUrl: map['assetImageUrl'],
      isPremium: map['isPremium'],
      rating: map['rating'].toDouble(),
    );
  }

  // Method to print KomikModel as a string (for debugging)
  @override
  String toString() {
    return 'KomikModel(title: $title, subtitle: $subtitle, genres: $genres, totalChapters: $totalChapters, author: $author, assetImageUrl: $assetImageUrl, isPremium: $isPremium, rating: $rating)';
  }

  // Method to get genres as a formatted string
  String getGenresString() {
    return 'Genres: ${genres.join(', ')}';
  }
}
