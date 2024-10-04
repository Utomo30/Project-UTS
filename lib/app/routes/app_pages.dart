import 'package:get/get.dart';

import '../modules/admin/form/bindings/admin_form_binding.dart';
import '../modules/admin/form/views/admin_form_view.dart';
import '../modules/admin/home/bindings/admin_home_binding.dart';
import '../modules/admin/home/views/admin_home_view.dart';
import '../modules/detail_komik/bindings/detail_komik_binding.dart';
import '../modules/detail_komik/views/detail_komik_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/about_view.dart'; // Tambahkan import ini
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KOMIK,
      page: () => const DetailKomikView(),
      binding: DetailKomikBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const AdminHomeView(),
          binding: AdminHomeBinding(),
        ),
        GetPage(
          name: _Paths.FORM,
          page: () => const AdminFormView(),
          binding: AdminFormBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
    ),
  ];
}
