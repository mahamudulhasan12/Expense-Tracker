import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:agent_test/features/dashboard/views/dashboard_screen.dart';
import '../controller/navigation_controller.dart';


class NavigationScreen extends StatelessWidget {
  NavigationScreen({super.key});

  final NavigationController controller = Get.put(NavigationController());

  final List<Widget> screens = [
    DashboardScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => screens[controller.selectIndex.value],
      ),

      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: controller.selectIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff064D82),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 36),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}