// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:comic_app/app/helpers/const.dart';
import 'package:comic_app/app/helpers/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                getTheme(context).primaryColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 70), // Menambahkan jarak atas
                      Image.asset(imgLogo, height: 70),
                      SizedBox(height: 5),
                      Text(
                        "Login to $appName",
                        style: getTextTheme(context).headlineSmall?.copyWith(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                elevation: 8, // Menambahkan bayangan pada card
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: getTheme(context).primaryColor),
                          icon: Icon(
                            Icons.email,
                            color: getTheme(context).primaryColor,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: getTheme(context).primaryColor),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 12),
                      Obx(
                        () => TextFormField(
                          obscureText: !controller.showPassword.value,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: getTheme(context).primaryColor),
                            icon: Icon(
                              Icons.lock,
                              color: getTheme(context).primaryColor,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: getTheme(context).primaryColor),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              },
                              icon: controller.showPassword.value
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Forget Password?"),
                          style: TextButton.styleFrom(
                              foregroundColor: getTheme(context).primaryColor),
                        ),
                      ),
                      SizedBox(height: 12),
                      Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getTheme(context).primaryColor,
                            foregroundColor:
                                getTheme(context).colorScheme.onPrimary,
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            "Login as ${controller.userType()}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Obx(
                        () => TextButton(
                          onPressed: () {
                            controller.loginAsCreator.value =
                                !controller.loginAsCreator.value;
                          },
                          child: Text(
                            "Not a ${controller.userType()}?\nLogin as ${controller.userType(reverse: true)}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: getTheme(context).primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
