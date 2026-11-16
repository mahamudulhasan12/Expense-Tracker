
import 'dart:developer';

import 'package:agent_test/features/auth/storage%20/storage_serviece.dart';
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

  Future<void> LogoutService() async {

    Uri uri = Uri.parse("https://b5.dokanibahe.com/api/v1/logout");
    final FlutterSecureStorage storage = FlutterSecureStorage();
    String? token = await storage.read(key: "token");
      var res =await http.post(
        uri,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if(res.statusCode == 200){
        storage.delete(key: 'token');
        log("logout Sucessfully");
        Get.snackbar("Logout", "Logout Success");
      }else{
        log("failed");
      }

  }
}
