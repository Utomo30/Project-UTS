import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/modules/home/views/drawer.dart';
import 'package:comic_app/app/modules/home/views/komik_card.dart';
import 'package:comic_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.toNamed(Routes.ADMIN_FORM);
          }),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Information
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: InkWell(
                    onTap: () {
                      controller.scaffoldKey.currentState?.openDrawer();
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imgProfile),
                      radius: 40,
                    ),
                  ),
                  title: Text("Selamat ${controller.getTimeCategory()}",
                      style: getTextTheme(context)
                          .labelMedium
                          ?.copyWith(color: Colors.grey)),
                  subtitle: Text(
                    dummyUsername,
                    style: getTextTheme(context)
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: getTheme(context).primaryColor,
                    ),
                  ),
                ),

                // Search bar
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search comic",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor:
                            getTheme(context).colorScheme.secondaryContainer,
                        prefixIcon: const Icon(Icons.search),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16)),
                  ),
                ),

                // Komik Card
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: dummyKomiks.length,
                  itemBuilder: (context, index) {
                    return KomikCard(
                      komik: dummyKomiks[index],
                      onClick: () {
                        Get.toNamed(Routes.ADMIN_FORM,
                            arguments: dummyKomiks[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
