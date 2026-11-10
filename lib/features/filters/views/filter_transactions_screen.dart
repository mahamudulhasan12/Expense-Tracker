import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dropdown_field.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/filter_controller.dart';

class FilterTransactionsScreen extends StatelessWidget {
  FilterTransactionsScreen({super.key});

  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Filter Transactions'),
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
              // Tabs
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFilterTab('All', 0),
                        _buildFilterTab('Income', 1),
                        _buildFilterTab('Expense', 2),
                        _buildFilterTab('Transfer', 3),
                      ],
                    )),
              ),
              const SizedBox(height: 20),
              Obx(() => AppDropdownField(
                    label: 'Category',
                    value: controller.selectedCategory.value,
                    items: const ['All Categories', 'Food', 'Transport', 'Shopping', 'Bills', 'Salary'],
                    onChanged: (val) {
                      if (val != null) controller.setCategory(val);
                    },
                  )),
              const SizedBox(height: 20),
              Obx(() => AppDropdownField(
                    label: 'Account',
                    value: controller.selectedAccount.value,
                    items: const ['All Accounts', 'Bank Account', 'bKash', 'Nagad', 'Cash'],
                    onChanged: (val) {
                      if (val != null) controller.setAccount(val);
                    },
                  )),
              const SizedBox(height: 20),
              const Text('Amount Range', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Expanded(child: AppTextField(label: '', hint: 'Min')),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('-', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                  ),
                  Expanded(child: AppTextField(label: '', hint: 'Max')),
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => AppDropdownField(
                    label: 'Date Range',
                    value: controller.selectedDateRange.value,
                    items: const ['This Month', 'Last Month', 'Custom Range'],
                    onChanged: (val) {
                      if (val != null) controller.setDateRange(val);
                    },
                  )),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Apply Filter',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Reset', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTab(String title, int index) {
    final isSelected = controller.selectedTab.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
