import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeController extends GetxController {
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
