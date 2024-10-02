// ignore_for_file: prefer_const_constructors
import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/modules/home/views/drawer.dart';
import 'package:comic_app/app/modules/home/views/komik_card.dart';
import 'package:comic_app/app/modules/home/views/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: HomeDrawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getTheme(context).colorScheme.primary.withOpacity(0.1),
                getTheme(context).colorScheme.secondary.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
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
                  title: Text(
                    "Selamat ${controller.getTimeCategory()}",
                    style: getTextTheme(context)
                        .labelMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  subtitle: Text(
                    dummyUsername,
                    style: getTextTheme(context).titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: getTheme(context).primaryColor,
                        ),
                  ),
                  trailing: Obx(() => IconButton(
                        onPressed: () {
                          controller.toggleNotification();
                        },
                        icon: Icon(
                          controller.isNotificationActive.value
                              ? Icons.notifications
                              : Icons.notifications_outlined,
                          color: getTheme(context).primaryColor,
                        ),
                      )),
                ),

                // Search bar
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
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
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),

                // Trending Manga
                Text(
                  "Trending Manga",
                  style: getTextTheme(context).titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: dummyKomiks.length,
                    itemBuilder: (context, index) =>
                        TrendingCard(komik: dummyKomiks[index])
                            .marginOnly(right: 12),
                  ),
                ),

                // Filter / Category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: List.generate(
                        controller.contentTypes.length,
                        (index) => Obx(
                          () => Card(
                            color: controller.contentTypes[index] ==
                                    controller.selectedType
                                ? getTheme(context).primaryColor
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(
                                color: getTheme(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            margin: EdgeInsets.only(right: 16),
                            child: InkWell(
                              onTap: () {
                                controller.selectedType =
                                    controller.contentTypes[index];
                              },
                              borderRadius: BorderRadius.circular(24),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Text(
                                  controller.contentTypes[index],
                                  style: getTextTheme(context)
                                      .labelLarge
                                      ?.copyWith(
                                        color: controller.contentTypes[index] ==
                                                controller.selectedType
                                            ? getTheme(context)
                                                .colorScheme
                                                .onPrimary
                                            : getTheme(context).primaryColor,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Komik Card
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: controller.filteredKomik.length,
                    itemBuilder: (context, index) {
                      return KomikCard(
                        komik: controller.filteredKomik[index],
                        onClick: () {
                          controller.openDetail(
                              context, controller.filteredKomik[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
