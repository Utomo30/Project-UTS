import 'package:comic_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  var showPassword = false.obs;
  var loginAsCreator = false.obs;
  String userType({bool reverse = false}) =>
      (reverse ? !loginAsCreator.value : loginAsCreator.value)
          ? "Creator"
          : "User";

  void login() {
    String route = loginAsCreator.value ? Routes.ADMIN_HOME : Routes.HOME;
    Get.offAllNamed(route);
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
