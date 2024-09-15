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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(imgLogo, height: 100),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Login to $appName",
                      style: getTextTheme(context).titleLarge,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        icon: Icon(
                          Icons.email,
                          color: getTheme(context).primaryColor,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => TextFormField(
                        obscureText: !controller.showPassword.value,
                        decoration: InputDecoration(
                            labelText: "Password",
                            icon: Icon(
                              Icons.lock,
                              color: getTheme(context).primaryColor,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showPassword.value =
                                      !controller.showPassword.value;
                                },
                                icon: controller.showPassword.value
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility))),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {}, child: Text("Forget Password?")),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: getTheme(context).primaryColor,
                            foregroundColor:
                                getTheme(context).colorScheme.onPrimary),
                        onPressed: () {
                          controller.login();
                        },
                        child: Text("Login as ${controller.userType()}"),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: () {
                          controller.loginAsCreator.value =
                              !controller.loginAsCreator.value;
                        },
                        child: Text(
                          "Not a ${controller.userType()}?\nLogin as ${controller.userType(reverse: true)}",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 24)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
