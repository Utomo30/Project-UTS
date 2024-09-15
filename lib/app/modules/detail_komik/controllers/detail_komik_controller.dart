import 'package:comic_app/app/data/KomikModel.dart';
import 'package:get/get.dart';

class DetailKomikController extends GetxController {
  late KomikModel komik;

  var _chapter = 0.obs;
  get chapter => this._chapter.value;
  set chapter(value) => this._chapter.value = value;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == null) {
      Get.back();
      Get.snackbar("Failed", "Failed to load komik data");
    } else {
      komik = Get.arguments[0];
      chapter = Get.arguments[1];
    }
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
