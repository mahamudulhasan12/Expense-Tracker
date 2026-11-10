import 'package:get/get.dart';

class AccountController extends GetxController {
  var selectedAccountType = 'Cash'.obs;

  void setAccountType(String type) {
    selectedAccountType.value = type;
  }
}
