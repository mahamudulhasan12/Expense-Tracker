import 'package:get/get.dart';

class SettingsController extends GetxController {
  var darkMode = false.obs;
  var notificationsEnabled = true.obs;

  void toggleDarkMode(bool val) {
    darkMode.value = val;
  }

  void toggleNotifications(bool val) {
    notificationsEnabled.value = val;
  }
}
