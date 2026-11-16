import 'dart:convert';
import 'dart:developer';


import 'package:agent_test/features/auth/storage%20/storage_serviece.dart';
import 'package:agent_test/features/dashboard/views/dashboard_screen.dart';
import 'package:agent_test/navigation_screen/navigaton/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var obscurePassword = true.obs;
  var rememberMe = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void submitLogin(){
    if(formKey.currentState!.validate()){
      LoginService(email: emailController.text, password: passwordController.text);
    }
  }
  Future LoginService({required String email , required String password})async{
    try{
      Map d ={
        "email":emailController.value.text,
        "password":passwordController.value.text,
      };

      Uri url = Uri.parse('https://b5.dokanibahe.com/api/v1/login');
      var res = await http.post(
          url,
          body: jsonEncode(d),
          headers:{
            "Accept": "application/json",
            "Content-Type": "application/json",
          }
      );
      log("========");
      var data = jsonDecode(res.body);
      if(res.statusCode == 200){
        log("${jsonDecode(res.body)}");
        Get.snackbar("Success", "Login Success");


        String token = data['data']['token'].toString();
        log("${token}");
        await StorageServiece.saveToken(token);
        // log("${data['user']['name']}");
        Get.off(NavigationScreen());

      }
      else{
        print("login faild");
        Get.snackbar("Failed", "Login Failed");

      }

    }catch(e){
      Get.snackbar("Error", "Something went wrong");
    }
  }
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
  @override
  void onInit() {
    // Login(email:emailController.value.text, password: passwordController.value.text);
    super.onInit();
  }
}
