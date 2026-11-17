
import 'dart:developer';

import 'package:agent_test/features/auth/storage%20/storage_serviece.dart';
import 'package:agent_test/features/auth/views/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  var darkMode = false.obs;
  var notificationsEnabled = true.obs;

  void toggleDarkMode(bool val) {
    darkMode.value = val;
  }

  void toggleNotifications(bool val) {
    notificationsEnabled.value = val;
  }

  Future<void> logoutService() async {
    final Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/logout");

    try {
      final String? token = await StorageServiece.getToken();

      final res = await http.post(
        uri,
        headers: {
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 15));

      log("logout status: ${res.statusCode}");

      // 200 = success, 401 = token already invalid, dui khetreii local logout hobe
      if (res.statusCode == 200 || res.statusCode == 401) {
        await StorageServiece.removeToken();
        Get.snackbar("Logout", "Logout Success");
        Get.offAll(() => LoginScreen()); // back stack clear kore login e jabe
      } else {
        Get.snackbar("Error", "Logout failed, abar try korun");
      }
    } catch (e) {
      log("logout error: $e");
      Get.snackbar("Error", "Internet connection check korun");
    }
  }
}
