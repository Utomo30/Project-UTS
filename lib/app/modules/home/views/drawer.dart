import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:comic_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // User Account Information
          UserAccountsDrawerHeader(
            accountName: Text(dummyUsername),
            accountEmail: Text(dummyEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(imgProfile),
            ),
            decoration: BoxDecoration(
              color: getTheme(context).primaryColor,
            ),
          ),
          // List of items or settings
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    // Handle profile tap
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle settings tap
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
            ),
          ),
        ],
      ),
    );
  }
}
