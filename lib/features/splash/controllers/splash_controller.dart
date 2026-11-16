import 'package:agent_test/features/auth/storage%20/storage_serviece.dart';
import 'package:agent_test/features/auth/views/login_screen.dart';
import 'package:agent_test/features/dashboard/views/dashboard_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  Future<void> initialize() async {
    // Future.delayed(Duration(milliseconds: 20));
    String ?token = await StorageServiece.getToken();
    if(token != null && token.isNotEmpty){
      Get.off(()=>DashboardScreen());
    }else{
      Get.offAll(()=>LoginScreen());
    }
  }

  @override
  void onInit() {
    initialize();
    super.onInit();
  }
}
