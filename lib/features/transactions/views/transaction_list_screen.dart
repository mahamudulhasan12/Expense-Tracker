import 'package:agent_test/features/reports/views/expense_report_screen.dart';
import 'package:agent_test/features/transactions/views/add_income_screen.dart';
import 'package:agent_test/shared/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/transaction_item.dart';
import '../controllers/transaction_controller.dart';

class TransactionListScreen extends StatelessWidget {
  TransactionListScreen({super.key});

  final TransactionController controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          bottom: const TabBar(

            indicatorColor: Colors.amber,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(child: Text("All",style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold
              ),),),
              Tab(child: Text("Income"),),
              Tab(child: Text("Expense"),),
              Tab(child: Text("Transfer"),),
            ],
          ),
          title: const Text('Transactions'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, size: 20),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: AppColors.textPrimary),
              onPressed: () {},
            ),
          ],

        ),
        body: TabBarView(children: [
          SafeArea(
            child: Column(
              children: [
                // Tabs
                SizedBox(height: 10),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Text('Today, 05 Oct 2024', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                          fontSize: 13)),
                      SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: [
                            TransactionItem(
                              title: 'Food',
                              subtitle: 'Cash',
                              amount: '- ৳ 500.00',
                              isIncome: false,
                              icon: Icons.fastfood,
                              onTap: () {},
                            ),
                            const Divider(color: AppColors.border),
                            TransactionItem(
                              title: 'Salary',
                              subtitle: 'Bank Account',
                              amount: '+ ৳ 50,000.00',
                              isIncome: true,
                              icon: Icons.account_balance,
                              onTap: () {},
                            ),
                            const Divider(color: AppColors.border),
                            TransactionItem(
                              title: 'Transport',
                              subtitle: 'bKash',
                              amount: '- ৳ 200.00',
                              isIncome: false,
                              icon: Icons.directions_bus,
                              onTap: () {},
                            ),
                            const Divider(color: AppColors.border),
                            TransactionItem(
                              title: 'Shopping',
                              subtitle: 'Nagad',
                              amount: '- ৳ 1,500.00',
                              isIncome: false,
                              icon: Icons.shopping_bag,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text('Yesterday, 04 Oct 2024', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                          fontSize: 13)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(
                          children: [
                            TransactionItem(
                              title: 'Internet',
                              subtitle: 'Bank Account',
                              amount: '- ৳ 1,000.00',
                              isIncome: false,
                              icon: Icons.wifi,
                              onTap: () {},
                            ),
                            const Divider(color: AppColors.border),
                            TransactionItem(
                              title: 'Electricity',
                              subtitle: 'Cash',
                              amount: '- ৳ 800.00',
                              isIncome: false,
                              icon: Icons.flash_on,
                              onTap: () {},
                            ),
                            const Divider(color: AppColors.border),
                            TransactionItem(
                              title: 'Transfer',
                              subtitle: 'bKash → Bank',
                              amount: '- ৳ 5,000.00',
                              isIncome: false,
                              icon: Icons.swap_horiz,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(child: AppText(text: "Income Screen",fontWeight: FontWeight.bold,)),
          ExpenseReportScreen(),
          Center(child: AppText(text: "Income Screen",fontWeight: FontWeight.bold,)),
        ]),
      ),
    );
  }
}