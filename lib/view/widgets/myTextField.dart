// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:posts_app/common/colors.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final hint;
  final bool isPassword;
  bool isTall = false;
  MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.isTall,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 80,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: isTall ? null : 1,
        minLines: isTall ? null : 1,
        expands: isTall ? true : false,
        style: const TextStyle(color: MyColors.babyBlue),
        obscureText: isPassword == true ? true : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          labelStyle: const TextStyle(color: MyColors.babyBlue, fontSize: 20),
          labelText: "$hint",
        ),
        controller: controller,
      ),
    );
  }
}
