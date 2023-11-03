// ignore_for_file: file_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/NavController.dart';
import 'package:posts_app/controller/UsersDataController.dart';
import 'package:posts_app/view/screens/Home_Page.dart';
import 'package:posts_app/view/screens/MyPosts_Page.dart';

class NavPage extends StatelessWidget {
  NavPage({super.key});

  final List<Widget> screens = [const HomePage(), MyPosts()];

  final controller = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.backGround,
        bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            index: NavController().currentInd,
            onTap: (value) {
              controller.changeInd(value);
            },
            backgroundColor: Colors.transparent,
            color: MyColors.divider,
            items: [
              const Icon(
                Icons.home,
                size: 35,
              ),
              SizedBox(
                width: 45,
                child: Image.asset("assets/images/addposticon.png"),
              )
            ]),
        body: GetBuilder<NavController>(
            builder: (controller) => Column(children: [
                  GetBuilder(
                    init: UsersDataController(),
                    builder: (controller) {
                      return Material(
                        color: const Color.fromARGB(255, 1, 15, 26),
                        elevation: 20,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Stack(alignment: Alignment.center, children: [
                                  SizedBox(
                                    width: 83,
                                    child: LottieBuilder.asset(
                                        "assets/animation/backAnim3.json"),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                      controller.tokenPic!,
                                    ),
                                  ),
                                ]),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "𝓗𝓮𝓵𝓵𝓸, ",
                                        style: TextStyle(
                                            fontSize: 20, color: MyColors.pink),
                                      ),
                                      TextSpan(
                                        text: controller.tokenName,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            color: MyColors.babyBlue),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/palestine.webp",
                                  width: 30,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Get.snackbar("Notification 🔔",
                                          "Sorry, You Don't have any Notifications to View");
                                    },
                                    icon: const Icon(
                                      Icons.notifications,
                                      color: MyColors.pink,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      Get.snackbar("Notification 🔔",
                                          "You have Successfully Logged Out of your Account");
                                      Get.offAllNamed("/");
                                    },
                                    icon: const Icon(
                                      Icons.logout,
                                      color: MyColors.pink,
                                    )),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(child: screens[controller.currentInd])
                ])),
      ),
    );
  }
}
