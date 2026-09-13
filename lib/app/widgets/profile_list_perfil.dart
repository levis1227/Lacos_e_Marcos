import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileListPerfil extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget? trailing;
  final VoidCallback? onTap;

  const ProfileListPerfil({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.8.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 20.sp,
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}