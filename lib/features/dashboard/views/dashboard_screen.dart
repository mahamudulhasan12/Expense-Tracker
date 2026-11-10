import 'package:agent_test/features/transactions/views/add_expense_screen.dart';
import 'package:agent_test/features/transactions/views/add_income_screen.dart';
import 'package:agent_test/features/transfer/views/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/app_summary_card.dart';
import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primary,
                    child: Text('T', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Mahamudul', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary)),
                      Text('Good Morning ', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Month selector dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: DropdownButtonHideUnderline(
                  child: Obx(() => DropdownButton<String>(
                        value: controller.selectedMonth.value,
                        isExpanded: true,
                        items: ['October 2024', 'September 2024', 'August 2024'].map((month) {
                          return DropdownMenuItem(value: month, child: Text(month, style: const TextStyle(fontWeight: FontWeight.bold)));
                        }).toList(),
                        onChanged: (val) {
                          if (val != null) controller.changeMonth(val);
                        },
                      )),
                ),
              ),
              const SizedBox(height: 20),
              // Total Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        IconButton(
                          icon: Obx(() => Icon(controller.hideBalance.value ? Icons.visibility_off : Icons.visibility, color: Colors.white70, size: 20)),
                          onPressed: controller.toggleHideBalance,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          controller.hideBalance.value ? '৳ ********' : '৳ 45,500.00',
                          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.arrow_downward, color: AppColors.incomeGreen, size: 16),
                            SizedBox(width: 4),
                            Text('Income\n৳ 80,000.00', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.arrow_upward, color: AppColors.expenseRed, size: 16),
                            SizedBox(width: 4),
                            Text('Expense\n৳ 34,500.00', style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Quick Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickActionButton(Icons.add, 'Income', AppColors.incomeGreen, () {
                    Get.to(AddIncomeScreen());
                  }),
                  _buildQuickActionButton(Icons.remove, 'Expense', AppColors.expenseRed, () {Get.to(AddExpenseScreen());}),
                  _buildQuickActionButton(Icons.swap_horiz, 'Transfer', AppColors.transferBlue, () {Get.to(TransferScreen());}),
                ],
              ),
              const SizedBox(height: 24),
              // This Month Summary Grid
              const Text('This Month', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    AppSummaryCard(
                      title: 'Income',
                      amount: '৳ 80,000',
                      amountColor: AppColors.incomeGreen,
                      icon: Icons.arrow_downward,
                      iconBgColor: AppColors.incomeGreen,
                    ),
                    SizedBox(width: 12),
                    AppSummaryCard(
                      title: 'Expense',
                      amount: '৳ 34,500',
                      amountColor: AppColors.expenseRed,
                      icon: Icons.arrow_upward,
                      iconBgColor: AppColors.expenseRed,
                    ),
                    SizedBox(width: 12),
                    AppSummaryCard(
                      title: 'Balance',
                      amount: '৳ 45,500',
                      amountColor: AppColors.primary,
                      icon: Icons.account_balance_wallet,
                      iconBgColor: AppColors.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Expense by Category Section
              const Text('Expense by Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 12),
                      ),
                      child: const Center(child: Text('Chart', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                    ),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CategoryLegend(color: Colors.blue, title: 'Food', percentage: '35%'),
                          _CategoryLegend(color: Colors.green, title: 'Transport', percentage: '20%'),
                          _CategoryLegend(color: Colors.orange, title: 'Shopping', percentage: '18%'),
                          _CategoryLegend(color: Colors.purple, title: 'Bills', percentage: '15%'),
                          _CategoryLegend(color: Colors.grey, title: 'Others', percentage: '12%'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Obx(() => BottomNavigationBar(
      //       currentIndex: controller.bottomNavIndex.value,
      //       onTap: controller.changeBottomNav,
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: AppColors.primary,
      //       unselectedItemColor: AppColors.textSecondary,
      //       items: const [
      //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
      //         BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transactions',),
      //         BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 36, color: AppColors.primary), label: ''),
      //         BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
      //         BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      //       ],
      //     )),
    );
  }

  Widget _buildQuickActionButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _CategoryLegend extends StatelessWidget {
  final Color color;
  final String title;
  final String percentage;

  const _CategoryLegend({required this.color, required this.title, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
               SizedBox(width: 8),
              Text(title, style:  TextStyle(fontSize: 13, color: AppColors.textPrimary)),
            ],
          ),
          Text(percentage, style:  TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
