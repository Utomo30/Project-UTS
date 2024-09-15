import 'package:get/get.dart';

import '../controllers/admin_form_controller.dart';

class AdminFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminFormController>(
      () => AdminFormController(),
    );
  }
}
