import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/category_controller.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Category'),
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
                label: 'Category Name',
                hint: 'Enter category name',
              ),
              const SizedBox(height: 20),
              const Text('Icon', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildIconBox(Icons.fastfood, Colors.orange),
                  _buildIconBox(Icons.directions_bus, Colors.blue),
                  _buildIconBox(Icons.shopping_bag, Colors.purple),
                  _buildIconBox(Icons.receipt, Colors.green),
                  _buildIconBox(Icons.school, Colors.indigo),
                  _buildIconBox(Icons.medical_services, Colors.red),
                  _buildIconBox(Icons.movie, Colors.amber),
                  _buildIconBox(Icons.category, Colors.grey),
                  _buildIconBox(Icons.flight, Colors.teal),
                  _buildIconBox(Icons.pets, Colors.brown),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Type', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Expense'),
                          value: 'Expense',
                          groupValue: controller.selectedType.value,
                          onChanged: (val) {
                            if (val != null) controller.setType(val);
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Income'),
                          value: 'Income',
                          groupValue: controller.selectedType.value,
                          onChanged: (val) {
                            if (val != null) controller.setType(val);
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Save',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Center(
        child: Icon(icon, color: color),
      ),
    );
  }
}
