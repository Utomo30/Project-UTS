// lib/app/modules/home/views/drawer.dart

import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_view.dart'; // Tambahkan import ini

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
      ),
      child: Container(
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
        child: Column(
          children: <Widget>[
            // User Account Information
            UserAccountsDrawerHeader(
              accountName: Text(
                dummyUsername,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                dummyEmail,
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(imgProfile),
              ),
              decoration: BoxDecoration(
                color: getTheme(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
            // List of items or settings
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () {
                      Get.toNamed('/profile');
                      // Handle profile tap
                    },
                  ),
                  const Divider(), // Adding a divider for better separation
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help'),
                    onTap: () {
                      // Handle help tap
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {
                      Get.to(AboutView()); // Navigasi ke AboutView
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
