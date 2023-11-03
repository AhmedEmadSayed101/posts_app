// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/UsersDataController.dart';
import 'package:posts_app/model/UsersModel.dart';
import 'package:posts_app/view/widgets/myTextField.dart';

class SignUp_Page extends StatelessWidget {
  SignUp_Page({super.key});

  final regesUserNameController = TextEditingController();
  final regesAccountController = TextEditingController();
  final regesPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backGround,
        body: Center(
          child: GetBuilder<UsersDataController>(
            init: UsersDataController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: LottieBuilder.asset(
                          "assets/animation/signupAnim.json"),
                    ),
                    const Text(
                      "SignUp",
                      style: TextStyle(
                          fontSize: 30,
                          color: MyColors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                    MyTextField(
                      isPassword: false,
                      hint: "UserName",
                      controller: regesUserNameController,
                      isTall: false,
                    ),
                    MyTextField(
                      isPassword: false,
                      hint: "Account",
                      controller: regesAccountController,
                      isTall: false,
                    ),
                    MyTextField(
                      isPassword: true,
                      hint: "Password",
                      controller: regesPasswordController,
                      isTall: false,
                    ),
                    Container(
                      width: 300,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(MyColors.purple)),
                          onPressed: () {
                            if (regesAccountController.text.isEmpty ||
                                regesPasswordController.text.isEmpty ||
                                regesUserNameController.text.isEmpty) {
                              Get.snackbar("Something Went Wrong ❌",
                                  "Please Complete All Fields");
                            } else {
                              final userData = {
                                "userName": regesUserNameController.text,
                                "account": regesAccountController.text,
                                "password": regesPasswordController.text
                              };
                              controller.addUser(User.fromJson(userData));
                              Get.toNamed("/LogIn");
                            }
                            regesAccountController.clear();
                            regesPasswordController.clear();
                            regesUserNameController.clear();
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 30, color: MyColors.babyBlue),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/LogIn");
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Don't have account? ",
                                style: TextStyle(color: MyColors.babyBlue)),
                            TextSpan(
                                text: "LogIn",
                                style: TextStyle(color: MyColors.pink))
                          ]),
                        )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
