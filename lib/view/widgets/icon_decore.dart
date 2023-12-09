import 'package:flutter/material.dart';
import 'package:note_muse/view/common/app_colors.dart';

class IconDecore extends StatelessWidget {
  const IconDecore({
    super.key,
    required this.onTap,
    required this.icon,
    this.bgColor,
    this.iconColor,
  });
  final VoidCallback onTap;
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primary.withOpacity(.7),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: iconColor ?? AppColors.light,
          ),
        ),
      ),
    );
  }
}
