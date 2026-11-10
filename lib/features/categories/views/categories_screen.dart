import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/category_item.dart';
import '../controllers/category_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Obx(() => Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.changeTab(0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 0 ? AppColors.primary : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Expense',
                                style: TextStyle(
                                  color: controller.selectedTab.value == 0 ? Colors.white : AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => controller.changeTab(1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: controller.selectedTab.value == 1 ? AppColors.primary : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Income',
                                style: TextStyle(
                                  color: controller.selectedTab.value == 1 ? Colors.white : AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      children: [
                        CategoryItem(title: 'Food', transactionCount: '12 Transactions', icon: Icons.fastfood, color: Colors.orange, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Transport', transactionCount: '8 Transactions', icon: Icons.directions_bus, color: Colors.blue, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Shopping', transactionCount: '15 Transactions', icon: Icons.shopping_bag, color: Colors.purple, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Bills', transactionCount: '10 Transactions', icon: Icons.receipt, color: Colors.green, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Education', transactionCount: '5 Transactions', icon: Icons.school, color: Colors.indigo, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Medical', transactionCount: '7 Transactions', icon: Icons.medical_services, color: Colors.red, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Entertainment', transactionCount: '6 Transactions', icon: Icons.movie, color: Colors.amber, onTap: () {}),
                        const Divider(color: AppColors.border),
                        CategoryItem(title: 'Others', transactionCount: '4 Transactions', icon: Icons.category, color: Colors.grey, onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
