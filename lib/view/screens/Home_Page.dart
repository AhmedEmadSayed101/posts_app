// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts_app/common/colors.dart';
import 'package:posts_app/controller/PostsController.dart';
import 'package:posts_app/view/widgets/PostContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController());

    return Center(
        child: Column(
      children: [
        FutureBuilder(
            future: controller.fetchData(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : snapshot.hasData
                    ? snapshot.data!.isNotEmpty
                        ? Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) => PostConatiner(
                                      post: snapshot.data![index],
                                    ),
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    indent: 50,
                                    endIndent: 50,
                                    color: MyColors.divider,
                                  );
                                },
                                itemCount: snapshot.data!.length),
                          )
                        : const Center(child: CircularProgressIndicator())
                    : const Center(child: CircularProgressIndicator()))
      ],
    ));
  }
}
