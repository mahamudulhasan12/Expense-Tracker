import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedMonth = 'October 2024'.obs;
  var hideBalance = false.obs;
  var bottomNavIndex = 0.obs;

  void toggleHideBalance() {
    hideBalance.value = !hideBalance.value;
  }

  // void changeBottomNav(int index) {
  //   bottomNavIndex.value = index;
  // }

  void changeMonth(String month) {
    selectedMonth.value = month;
  }
}
