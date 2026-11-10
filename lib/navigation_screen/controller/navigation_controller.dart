import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectIndex = 0.obs;

  void changeIndex(int index) {
    if (index == 2) {
      Get.bottomSheet(
        Container(
          height: 180,
          color: Colors.white,
          child: const Center(
            child: Text('Expense | Income | Transfer'),
          ),
        ),
      );
    } else {
      selectIndex.value = index;
    }
  }
}