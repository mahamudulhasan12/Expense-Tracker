import 'dart:convert';
import 'dart:developer';

import 'package:agent_test/features/auth/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // Name Validator
  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Your Name";
    }

    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }

    return null;
  }

  // Email Validator
  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Your Email";
    }

    if (!GetUtils.isEmail(value.trim())) {
      return "Enter a valid Email";
    }

    return null;
  }

  // Phone Validator (Bangladesh)
  String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter Your Phone Number";
    }

    if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(value.trim())) {
      return "Enter a valid Bangladeshi phone number";
    }

    return null;
  }

  // Password Validator
  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Password";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "Include at least one uppercase letter";
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return "Include at least one number";
    }

    return null;
  }

  // Confirm Password Validator
  String? confirmPassValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm Your Password";
    }

    if (value != passwordController.text) {
      return "Password does not match";
    }

    return null;
  }

  void submitRegister(){
    if(formKey.currentState!.validate()){

      registerService(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text, confirmPass: confirmPasswordController.text);
    }
  }

  Future<void> registerService({required String name , required String email , required String phone,required String password,required String confirmPass , String ? address})async{
    try{
      Map d ={
        "name":nameController.text,
        "email":emailController.value.text,
        "phone":phoneController.text,
        "password":passwordController.value.text,
        "password_confirmation":passwordController.text,
        "address":addressController.text,
      };
      // Map d = {
      //   "name": "vsfs",
      //   "email": "afa@gmail.com",
      //   "phone": "01845525651",
      //   "password": "Ma123456",
      //   "password_confirmation": "Ma123456",
      //   "address": "Dinajpur, Bangladesh",
      // };

      Uri url = Uri.parse('https://b5.dokanibahe.com/api/v1/register');
      var res = await http.post(
          url,
          body: jsonEncode(d),
          headers:{
            "Accept": "application/json",
            "Content-Type": "application/json",
          }
      );
      var data = jsonDecode(res.body);
      log("Status Code: ${res.statusCode}");

      if(res.statusCode == 200 || res.statusCode == 201){
        log("register success");

        Get.snackbar(
          'Success',
          'Register successful',
        );
        Get.off(LoginScreen());
      }else{
        log("register failed");
        Get.snackbar(
          'Failed',
          '${data['message']}',
        );
      }
    }catch(e){
      log("$e");
    }


  }

  @override
  void onInit() {

    super.onInit();
  }

}