
import 'package:agent_test/features/transfer/views/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:agent_test/shared/widgets/app_button.dart';

import '../views/add_expense_screen.dart';
import '../views/add_income_screen.dart';


class TransactionBottomSheet extends StatelessWidget {
  const TransactionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Indicator
          Container(
            height: 5,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Select Transaction Type",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Expense
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: "Expense",
              backgroundColor: Colors.red,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
                Get.to(() => AddExpenseScreen());
              },
            ),
          ),

          const SizedBox(height: 12),

          // Income
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: "Income",
              backgroundColor: Colors.green,
              icon: const Icon(
                Icons.arrow_downward,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
                Get.to(() => AddIncomeScreen());
              },
            ),
          ),

          const SizedBox(height: 12),

          // Transfer
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: "Transfer",
              backgroundColor: Colors.blue,
              icon: const Icon(
                Icons.swap_horiz,
                color: Colors.white,
              ),
              onPressed: () {
                Get.back();
                Get.to(() => TransferScreen());
              },
            ),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
