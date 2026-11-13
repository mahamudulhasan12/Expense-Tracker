import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  var obscurePassword = true.obs;
  var rememberMe = false.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future Login({required String email , required String password})async{
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
      var data = jsonDecode(res.body);
      if(res.statusCode == 200){
        print("${data["data"]}");
        Get.snackbar("Success", "Login Success");
        return data['data'];;
      }
      else{
        print("login faild");
        Get.snackbar("Failed", "Login Failed");
        return data['error'];
      }

    }catch(e){
      Get.snackbar("Error", "Login Failed");
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
