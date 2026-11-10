import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String transactionCount;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.transactionCount,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.textPrimary),
      ),
      subtitle: Text(
        transactionCount,
        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
        onPressed: () {},
      ),
    );
  }
}
