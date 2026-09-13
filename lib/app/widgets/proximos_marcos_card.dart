import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';

class ProximosMarcosCard extends StatelessWidget {
  final String title;
  final String ageRange;
  final String imagePath;
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;

  const ProximosMarcosCard({
    super.key,
    required this.title,
    required this.ageRange,
    required this.imagePath,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColors.disabledButton,
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
              // Avatar circular responsivo
              Container(
                width: 20.w,
                height: 20.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7FAF7),
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 4.w),

              // Informações do Marco Esperado
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próximo marco esperado',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      title,
                      style: textTheme.titleMedium?.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      ageRange,
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),

              // Seta de navegação
              Icon(
                icon,
                color: iconColor,
                size: 16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}