import 'package:get/get.dart';

class BudgetController extends GetxController {
  var selectedMonth = 'October 2024'.obs;

  void setMonth(String month) {
    selectedMonth.value = month;
  }
}
