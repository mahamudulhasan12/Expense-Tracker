import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Settings / More'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // User Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.primary,
                    child: Text('T', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tanvir Ahmed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      SizedBox(height: 2),
                      Text('017XXXXXXXX', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Preferences', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Obx(() => SwitchListTile(
                        title: const Text('Dark Mode', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        secondary: const Icon(Icons.dark_mode_outlined, color: AppColors.primary),
                        value: controller.darkMode.value,
                        onChanged: controller.toggleDarkMode,
                        activeColor: AppColors.primary,
                      )),
                  const Divider(color: AppColors.border, height: 1),
                  Obx(() => SwitchListTile(
                        title: const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        secondary: const Icon(Icons.notifications_outlined, color: AppColors.primary),
                        value: controller.notificationsEnabled.value,
                        onChanged: controller.toggleNotifications,
                        activeColor: AppColors.primary,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('General', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.currency_exchange, color: AppColors.primary),
                    title: const Text('Currency', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    trailing: const Text('BDT (৳)', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.border, height: 1),
                  ListTile(
                    leading: const Icon(Icons.security, color: AppColors.primary),
                    title: const Text('Security & Privacy', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.border, height: 1),
                  ListTile(
                    leading: const Icon(Icons.help_outline, color: AppColors.primary),
                    title: const Text('Help & Support', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
                    onTap: () {},
                  ),
                  const Divider(color: AppColors.border, height: 1),
                  ListTile(
                    leading: const Icon(Icons.info_outline, color: AppColors.primary),
                    title: const Text('About App', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textSecondary),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.expenseRed),
              title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.expenseRed)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
