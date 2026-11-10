import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/account_controller.dart';

class AddAccountScreen extends StatelessWidget {
  AddAccountScreen({super.key});

  final AccountController controller = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Account'),
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
                label: 'Account Name',
                hint: 'Enter account name',
              ),
              const SizedBox(height: 20),
              const Text('Account Type', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildTypeBox(Icons.account_balance_wallet, 'Cash', Colors.green),
                  _buildTypeBox(Icons.account_balance, 'Bank', AppColors.primary),
                  _buildTypeBox(Icons.phone_android, 'bKash', Colors.pink),
                  _buildTypeBox(Icons.payments, 'Nagad', Colors.orange),
                  _buildTypeBox(Icons.credit_card, 'Credit', Colors.purple),
                  _buildTypeBox(Icons.card_membership, 'Card', Colors.blue),
                  _buildTypeBox(Icons.category, 'Other', Colors.grey),
                ],
              ),
              const SizedBox(height: 24),
              const AppTextField(
                label: 'Opening Balance',
                hint: '৳ 0.00',
                keyboardType: TextInputType.number,
              ),
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

  Widget _buildTypeBox(IconData icon, String label, Color color) {
    return Obx(() {
      final isSelected = controller.selectedAccountType.value == label;
      return GestureDetector(
        onTap: () => controller.setAccountType(label),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? color.withValues(alpha: 0.1) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isSelected ? color : AppColors.border, width: isSelected ? 2 : 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      );
    });
  }
}
