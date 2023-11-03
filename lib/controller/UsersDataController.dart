// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_app/controller/PostsController.dart';
import 'package:posts_app/model/UsersModel.dart';

class UsersDataController extends GetxController {
  final postController = Get.put(PostsController());

  int? tokenId;
  String? tokenName;
  String? tokenPic;

  List<User> users = [
    User(
        id: 1,
        userName: "𝓐𝓱𝓶𝓮𝓭",
        account: "ahmed@gmail.com",
        password: "1234",
        image: "assets/images/ahmed2.jpeg"),
    User(
        id: 2,
        userName: "𝓞𝓶𝓪𝓻",
        account: "omar@gmail.com",
        password: "1234",
        image: "assets/images/omar.jpeg"),
    User(
        id: 3,
        userName: "𝓜𝓮𝓼𝓼𝓲",
        account: "m",
        password: "1",
        image: "assets/images/messi.jpg"),
    User(
        id: 4,
        userName: "𝓗𝓪𝓶𝓪𝓭𝓪",
        account: "mohamed@gmail.com",
        password: "1234",
        image: "assets/images/mohamed.jpg"),
    User(
        id: 5,
        userName: "𝓐𝓫𝓸𝓣𝓻𝓲𝓴𝓪",
        account: "abotrika@gmail.com",
        password: "1234",
        image: "assets/images/abotrika.jpeg"),
    User(
        id: 6,
        userName: "𝓨𝓸𝓾𝓼𝓼𝓮𝓯",
        account: "youssef@gmail.com",
        password: "1234",
        image: "assets/images/youssef.jpg"),
    User(
        id: 7,
        userName: "𝓐𝓵𝓲",
        account: "ali@gmail.com",
        password: "1234",
        image: "assets/images/ali.jpg"),
    User(
        id: 8,
        userName: "𝓐𝓭𝓱𝓪𝓶",
        account: "adham@gmail.com",
        password: "1234",
        image: "assets/images/adham.jpg"),
    User(
        id: 9,
        userName: "𝓜𝓸𝔁",
        account: "mox@gmail.com",
        password: "1234",
        image: "assets/images/mox.jpg"),
    User(
        id: 10,
        userName: "𝓔𝓵𝓜𝓸𝓸𝓽",
        account: "elmoot@gmail.com",
        password: "1234",
        image: "assets/images/moot.jpg"),
  ];

  void addUser(User user) {
    users.add(user);
    update();
  }

  isCorrect(String accountController, String passwordController) {
    late bool isCorrect;
    for (var i in users) {
      if (accountController == i.account && passwordController == i.password) {
        tokenId = i.id;
        tokenName = i.userName;
        tokenPic = i.image;
        isCorrect = true;
        update();
        break;
      } else {
        isCorrect = false;
      }
    }
    if (isCorrect) {
      Get.offAllNamed("/Home");
    } else {
      Get.defaultDialog(
          title: "Something Went Wrong ❌",
          content: const Text("Wrong UserName or Password"));
    }
  }

  User returnUser(int postUserId) {
    return users.firstWhere((user) => user.id == postUserId);
  }
}
