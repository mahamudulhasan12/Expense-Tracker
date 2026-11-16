import 'package:agent_test/features/transactions/views/add_income_screen.dart';
import 'package:agent_test/shared/widgets/app_button.dart';
import 'package:agent_test/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectIndex = 0.obs;

  void changeScreen(value) {
    selectIndex.value = value;
  }
}
