import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/account_card.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('My Accounts'),
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
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            AccountCard(
              accountName: 'Cash',
              balance: '৳ 10,000.00',
              icon: Icons.account_balance_wallet,
              color: Colors.green,
              onTap: () {},
            ),
            AccountCard(
              accountName: 'Bank Account',
              balance: '৳ 50,000.00',
              icon: Icons.account_balance,
              color: AppColors.primary,
              onTap: () {},
            ),
            AccountCard(
              accountName: 'bKash',
              balance: '৳ 8,500.00',
              icon: Icons.phone_android,
              color: Colors.pink,
              onTap: () {},
            ),
            AccountCard(
              accountName: 'Nagad',
              balance: '৳ 3,000.00',
              icon: Icons.payments,
              color: Colors.orange,
              onTap: () {},
            ),
            AccountCard(
              accountName: 'Credit Card',
              balance: '৳ 5,000.00',
              icon: Icons.credit_card,
              color: Colors.purple,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
