import 'package:comic_app/app/data/KomikModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AdminFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final List<String> genreOptions = [
    'Action',
    'Adventure',
    'Fantasy',
    'Drama',
    'Comedy',
    'Romance'
  ];

  KomikModel? komikModel;

  TextEditingController titleC = TextEditingController();
  TextEditingController subtitleC = TextEditingController();
  TextEditingController authorC = TextEditingController();
  TextEditingController totalChapterC = TextEditingController();
  TextEditingController ratingC = TextEditingController();
  TextEditingController assetImageUrlC = TextEditingController();
  var genres = <String>[].obs;
  var isPremium = false.obs;

  // Flag to determine if it's editing or creating
  var isEditMode = false.obs;

  // Function to load details (for viewing or editing)
  void loadKomik(KomikModel komik, bool isEdit) {
    titleC.text = komik.title;
    subtitleC.text = komik.subtitle;
    authorC.text = komik.author;
    totalChapterC.text = komik.totalChapters.toString();
    genres.value = komik.genres;
    ratingC.text = komik.rating.toString();
    assetImageUrlC.text = komik.assetImageUrl;
    isPremium.value = komik.isPremium;
    isEditMode.value = isEdit;
  }

  // Function to clear form (for creating a new Komik)
  void clearForm() {
    titleC.clear();
    subtitleC.clear();
    authorC.clear();
    totalChapterC.clear();
    genres.clear();
    ratingC.clear();
    assetImageUrlC.clear();
    isPremium.value = false;
    isEditMode.value = false;
  }

  // Save or update the Komik
  void saveOrUpdateKomik() {
    if (formKey.currentState?.validate() ?? false) {
      if (isEditMode.value) {
        Get.back();
        Get.snackbar("Success", "Data updated successfully");
      } else {
        Get.back();
        Get.snackbar("Success", "Data added successfully");
      }
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      komikModel = Get.arguments;
      loadKomik(komikModel!, true);
    }
  }

  void increment() => count.value++;
}

