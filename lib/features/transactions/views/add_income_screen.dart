import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dropdown_field.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/transaction_controller.dart';

class AddIncomeScreen extends StatelessWidget {
  AddIncomeScreen({super.key});

  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Income'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppTextField(
                label: 'Amount',
                hint: '৳ 0.00',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Obx(() => AppDropdownField(
                    label: 'Category',
                    value: controller.selectedCategory.value,
                    items: const ['Salary', 'Freelance', 'Investments', 'Gift', 'Other'],
                    onChanged: (val) {
                      if (val != null) controller.setCategory(val);
                    },
                  )),
              const SizedBox(height: 20),
              Obx(() => AppDropdownField(
                    label: 'Account',
                    value: controller.selectedAccount.value,
                    items: const ['Bank Account', 'bKash', 'Nagad', 'Cash'],
                    onChanged: (val) {
                      if (val != null) controller.setAccount(val);
                    },
                  )),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  AppTextField(
                    label: "Date",
                    hint: "2006-11-01",
                    controller: controller.dateController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.chooseDate(context);
                      },
                      icon: Icon(Icons.date_range_outlined),
                    ),
                  ),
                  // Obx(() => Text(
                  //   controller.transferDate.value,
                  // )),
                ],
              ),
              const SizedBox(height: 20),
              const AppTextField(
                label: 'Note (Optional)',
                hint: 'Write a note...',
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Save',
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
