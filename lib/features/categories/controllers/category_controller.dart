import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedTab = 0.obs;
  var selectedType = 'Expense'.obs;

  void changeTab(int tab) {
    selectedTab.value = tab;
  }

  void setType(String type) {
    selectedType.value = type;
  }
}
