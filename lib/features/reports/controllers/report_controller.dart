import 'package:get/get.dart';

class ReportController extends GetxController {
  var selectedTab = 0.obs; // 0: Overview, 1: Category, 2: Monthly
  var selectedPeriod = 'This Month'.obs;

  void changeTab(int tab) {
    selectedTab.value = tab;
  }

  void setPeriod(String period) {
    selectedPeriod.value = period;
  }
}
