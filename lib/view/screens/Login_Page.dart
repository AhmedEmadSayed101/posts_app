// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/UsersDataController.dart';
import 'package:posts_app/view/widgets/myTextField.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

var accountController = TextEditingController();
var passwordController = TextEditingController();

class _Login_PageState extends State<Login_Page> {
  final controller = Get.put(UsersDataController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backGround,
        body: GetBuilder<UsersDataController>(
          builder: (controller) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 350,
                      width: 400,
                      child: LottieBuilder.asset(
                          "assets/animation/loginAnim.json"),
                    ),
                    const Text(
                      "LogIn",
                      style: TextStyle(
                          fontSize: 30,
                          color: MyColors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      hint: "UserName",
                      controller: accountController,
                      isPassword: false,
                      isTall: false,
                    ),
                    MyTextField(
                      hint: "PassWord",
                      controller: passwordController,
                      isPassword: true,
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
                            if (accountController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar("Something Went Wrong ❌",
                                  "Please Complete All Fields");
                            } else {
                              controller.isCorrect(
                                  accountController.text.toString(),
                                  passwordController.text.toString());
                            }
                            accountController.clear();
                            passwordController.clear();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, color: MyColors.babyBlue),
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed("/SignUp");
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: "Don't have account? ",
                                style: TextStyle(color: MyColors.babyBlue)),
                            TextSpan(
                                text: "SignUp",
                                style: TextStyle(color: MyColors.pink))
                          ]),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
