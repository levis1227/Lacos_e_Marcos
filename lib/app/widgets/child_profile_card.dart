import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';

class ChildProfileCard extends StatelessWidget {
  final String name;
  final String age;
  final String birthDate;
  final String imagePath;
  final VoidCallback? onTap;

  const ChildProfileCard({
    super.key,
    required this.name,
    required this.age,
    required this.birthDate,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Row(
            children: [
              // Foto da criança
              Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 4.w),

              // Informações da criança
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 0.3.h),
                    Text(
                      age,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.3.h),
                    Text(
                      birthDate,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Seta
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.textSecondary,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}