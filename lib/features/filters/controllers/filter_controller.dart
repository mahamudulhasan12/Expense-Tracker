import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedTab = 0.obs; // 0: All, 1: Income, 2: Expense, 3: Transfer
  var selectedCategory = 'All Categories'.obs;
  var selectedAccount = 'All Accounts'.obs;
  var selectedDateRange = 'This Month'.obs;

  void changeTab(int tab) {
    selectedTab.value = tab;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  void setAccount(String account) {
    selectedAccount.value = account;
  }

  void setDateRange(String range) {
    selectedDateRange.value = range;
  }
}
