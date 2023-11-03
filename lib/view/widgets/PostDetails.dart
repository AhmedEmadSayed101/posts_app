// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:posts_app/common/colors.dart';

class PostDetails extends StatelessWidget {
  const PostDetails(
      {super.key, required this.txt, required this.pic, required this.titl});

  final String txt;
  final String pic;
  final String titl;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: MyColors.backGround),
        child: Column(
          children: [
            Stack(alignment: Alignment.bottomCenter, children: [
              SizedBox(
                height: 300,
                width: 500,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.asset(
                    pic,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titl,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MyColors.babyBlue,
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                txt,
                style: const TextStyle(color: MyColors.babyBlue, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
