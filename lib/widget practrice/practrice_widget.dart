import 'package:agent_test/shared/widgets/app_button.dart';
import 'package:agent_test/shared/widgets/app_text.dart';
import 'package:agent_test/widget%20practrice/practrice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValidationPractrice extends StatelessWidget {
  ValidationPractrice({super.key});

  PractriceController controller = Get.put(PractriceController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: AppText(text: "TextField Validation",fontWeight: FontWeight.bold,),
      ),
      body: SingleChildScrollView(
        child:Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                SizedBox(height: 100,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),


                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "email is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30,),
                TextFormField(
                  controller: controller.passwrodController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "password is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                AppButton(text: "Submit", onPressed: (){
                  controller.submitForm();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
