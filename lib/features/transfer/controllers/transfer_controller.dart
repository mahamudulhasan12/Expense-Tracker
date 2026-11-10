import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransferController extends GetxController {
  var fromAccount = 'Select account'.obs;
  var toAccount = 'Select account'.obs;
  var transferDate = ''.obs;

  final TextEditingController dateController = TextEditingController();

  // From Account
  void setFromAccount(String account) {
    fromAccount.value = account;
  }

  // To Account
  void setToAccount(String account) {
    toAccount.value = account;
  }

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
}