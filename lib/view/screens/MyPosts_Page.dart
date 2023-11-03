// ignore_for_file: file_names, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/PostsController.dart';
import 'package:posts_app/controller/UsersDataController.dart';
import 'package:posts_app/model/PostsModel.dart';
import 'package:posts_app/view/widgets/PostContainer.dart';
import 'package:posts_app/view/widgets/myTextField.dart';

class MyPosts extends StatelessWidget {
  MyPosts({super.key});

  TextEditingController myPostTitleController = TextEditingController();
  TextEditingController myPostBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UsersDataController userController = Get.find();

    return GetBuilder(
      init: PostsController(),
      builder: (postController) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(Container(
                decoration: const BoxDecoration(
                    color: MyColors.backGround,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Write Your Post 📌",
                      style: TextStyle(
                          color: MyColors.babyBlue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: MyColors.divider,
                      indent: 70,
                      endIndent: 70,
                    ),
                    Column(
                      children: [
                        MyTextField(
                          isPassword: false,
                          controller: myPostTitleController,
                          hint: "Post Tittle",
                          isTall: false,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MyTextField(
                          isPassword: false,
                          controller: myPostBodyController,
                          hint: "Your Post",
                          isTall: true,
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          if (myPostTitleController.text.isEmpty ||
                              myPostBodyController.text.isEmpty) {
                            Get.snackbar("Something Went Wrong ❌",
                                "Please Complete All Fields");
                          } else {
                            postController.addPost(Post(
                                id: Random().nextInt(10),
                                userId: userController.tokenId!,
                                title: myPostTitleController.text,
                                body: myPostBodyController.text));
                          }
                          myPostTitleController.clear();
                          myPostBodyController.clear();
                        },
                        child: const Text(
                          "Share Now !",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: MyColors.pink),
                        ))
                  ],
                )),
              ));
            },
            backgroundColor: MyColors.purple,
            child: const Icon(
              Icons.add_comment,
              size: 40,
            ),
          ),
          body: Container(
              decoration: const BoxDecoration(color: MyColors.backGround),
              child: Center(
                  child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: postController.myPosts.length,
                      itemBuilder: (context, index) {
                        return PostConatiner(
                            post: postController.myPosts[index]);
                      },
                    ),
                  ),
                ],
              ))),
        );
      },
    );
  }
}
