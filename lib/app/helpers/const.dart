import 'package:comic_app/app/data/KomikModel.dart';

String appName = "Comic App";

// HOME PAGE
String dummyUsername = "John Snow";
String dummyEmail = "johnsnow7@gmail.com";

// Image
String imgLogo = "assets/logo.png";
String imgProfile = "assets/profile.png";

// Dummy Panel List
List<String> panelList = [
  "assets/panel1.jpg",
  "assets/panel2.jpg",
];

// Dummy Komik Data
List<KomikModel> dummyKomiks = [
  KomikModel(
    title: 'Dragon Quest',
    subtitle: 'Epic adventure in a magical world',
    genres: ['Action', 'Adventure', 'Fantasy'],
    totalChapters: 120,
    author: 'Akira Ishikawa',
    assetImageUrl: 'assets/cover1.png',
    isPremium: true,
    rating: 4.9,
  ),
  KomikModel(
    title: 'Mystic Heroes',
    subtitle: 'Heroes battling ancient evils',
    genres: ['Action', 'Drama', 'Fantasy'],
    totalChapters: 85,
    author: 'Sakura Tanaka',
    assetImageUrl: 'assets/cover2.png',
    isPremium: false,
    rating: 4.5,
  ),
  KomikModel(
    title: 'The Lost Kingdom',
    subtitle: 'Journey through a forgotten land',
    genres: ['Adventure', 'Mystery', 'Drama'],
    totalChapters: 60,
    author: 'Hiroshi Yamamoto',
    assetImageUrl: 'assets/cover3.png',
    isPremium: false,
    rating: 4.2,
  ),
  KomikModel(
    title: 'Galactic Wars',
    subtitle: 'Interstellar conflicts and alliances',
    genres: ['Science Fiction', 'Action', 'Adventure'],
    totalChapters: 200,
    author: 'Yumi Nakamura',
    assetImageUrl: 'assets/cover4.png',
    isPremium: true,
    rating: 4.8,
  ),
  KomikModel(
    title: 'Shadow Chronicles',
    subtitle: 'Dark tales from the shadows',
    genres: ['Horror', 'Mystery', 'Supernatural'],
    totalChapters: 45,
    author: 'Ryuji Saito',
    assetImageUrl: 'assets/cover5.png',
    isPremium: true,
    rating: 4.6,
  ),
];
