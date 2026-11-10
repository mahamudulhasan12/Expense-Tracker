import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_button.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Transaction Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined, color: AppColors.textPrimary), onPressed: () {}),
          IconButton(icon: const Icon(Icons.delete_outline, color: AppColors.expenseRed), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.fastfood, color: Colors.white, size: 30),
                    ),
                    SizedBox(height: 16),
                    Text('Food & Dining', style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                    SizedBox(height: 4),
                    Text('- ৳ 500.00', style: TextStyle(color: AppColors.expenseRed, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 24),
                    Divider(color: AppColors.border),
                    SizedBox(height: 16),
                    _DetailRow(title: 'Transaction Type', value: 'Expense'),
                    SizedBox(height: 12),
                    _DetailRow(title: 'Account', value: 'Cash'),
                    SizedBox(height: 12),
                    _DetailRow(title: 'Date', value: '05 Oct 2024, 10:30 AM'),
                    SizedBox(height: 12),
                    _DetailRow(title: 'Note', value: 'Lunch with colleagues at restaurant.'),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: 'Back to Transactions',
                  isOutlined: true,
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String title;
  final String value;

  const _DetailRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
        Text(value, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
