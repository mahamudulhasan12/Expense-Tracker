import 'package:agent_test/features/auth/views/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  Future<void> initialize() async {
    await Future.delayed(const Duration(microseconds: 30));
    Get.off(LoginScreen());
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
