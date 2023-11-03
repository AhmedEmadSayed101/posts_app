// ignore_for_file: file_names

import 'package:get/get.dart';

class NavController extends GetxController {
  int currentInd = 0;
  changeInd(int val) {
    currentInd = val;
    update();
  }
}
