import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PractriceController extends GetxController{


  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Email validation successful',
      );
    }
  }

  @override
  void onClose() {
   emailController.dispose();
   passwrodController.dispose();
    super.onClose();
  }
}