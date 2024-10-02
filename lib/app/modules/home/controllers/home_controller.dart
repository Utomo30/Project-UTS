import 'package:comic_app/app/data/KomikModel.dart';
import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/modules/home/views/komik_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isNotificationActive = false.obs;

  void toggleNotification() {
    isNotificationActive.value = !isNotificationActive.value;
  }
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String getTimeCategory() {
    final int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return 'pagi';
    } else if (hour >= 12 && hour < 17) {
      return 'siang';
    } else if (hour >= 17 && hour < 19) {
      return 'sore';
    } else {
      return 'malam';
    }
  }

  List<String> contentTypes = [
    "All",
    "Free",
    "Premium",
  ];

  var _selectedType = "All".obs;
  get selectedType => this._selectedType.value;
  set selectedType(value) => this._selectedType.value = value;

  RxList<KomikModel> allKomik = dummyKomiks.obs;

  List<KomikModel> get filteredKomik => selectedType == "All"
      ? allKomik
      : allKomik
          .where(
            (komik) => komik.isPremium == (selectedType == "Premium"),
          )
          .toList();

  void openDetail(BuildContext context, KomikModel komik) async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return KomikDetail(
          komik: komik,
        );
      },
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
