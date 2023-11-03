// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/PostsController.dart';
import 'package:posts_app/controller/UsersDataController.dart';
import 'package:posts_app/model/PostsModel.dart';
import 'package:posts_app/model/UsersModel.dart';
import 'package:posts_app/view/widgets/PostDetails.dart';

class PostConatiner extends StatefulWidget {
  final Post post;

  const PostConatiner({super.key, required this.post});

  @override
  State<PostConatiner> createState() => _PostConatinerState();
}

class _PostConatinerState extends State<PostConatiner> {
  final UsersDataController userController = Get.find();
  final PostsController postController = Get.find();
  late User user;

  @override
  void initState() {
    user = userController.returnUser(widget.post.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(PostDetails(
            txt: widget.post.body, titl: widget.post.title, pic: user.image));
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            postController.deletePost(widget.post.id);
            Get.snackbar("notification !", "Your Post Was Archived 📦");
          } else {
            postController.deletePost(widget.post.id);
            Get.snackbar("notification !", "Your Post Was Deleted 🗑️");
          }
        },
        background: Container(
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          child: const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.archive,
              size: 35,
              color: MyColors.babyBlue,
            ),
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.delete,
              size: 35,
              color: MyColors.babyBlue,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              width: 450,
              child: Card(
                color: MyColors.purple,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(user.image),
                            radius: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            user.userName,
                            style: const TextStyle(
                                color: MyColors.babyBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      ),
                      Text(
                        widget.post.title,
                        style: const TextStyle(
                            color: MyColors.card,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                if (widget.post.isLoved == false) {
                                  widget.post.isLoved = true;
                                } else {
                                  widget.post.isLoved = false;
                                }
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: widget.post.isLoved
                                    ? MyColors.pink
                                    : MyColors.babyBlue,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.comment,
                                color: MyColors.babyBlue,
                              )),
                          IconButton(
                            onPressed: () {
                              Get.snackbar("Notification 🔔",
                                  "You Shared this Post 📤✔️");
                            },
                            icon: const Icon(
                              Icons.reply,
                              color: MyColors.babyBlue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
