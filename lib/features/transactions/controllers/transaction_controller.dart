import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  var selectedTab = 0.obs;
  var selectedCategory = 'Food'.obs;
  var selectedAccount = 'Bank Account'.obs;
  var transferDate = ''.obs;

  final TextEditingController dateController = TextEditingController();

  // From Account



  // Select Date
  Future<void> chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      transferDate.value = formattedDate;
      dateController.text = formattedDate;
    }
  }

  @override
  void onClose() {
    dateController.dispose();
    super.onClose();
  }

  void changeTab(int tab) {
    selectedTab.value = tab;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void setAccount(String account) {
    selectedAccount.value = account;
  }

}
