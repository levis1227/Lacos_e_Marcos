import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';

class BabyLinkCard extends StatelessWidget {
  final String image;
  final String maintext;
  final String subtext;
  final VoidCallback? onTap;

  const BabyLinkCard({
    super.key,
    required this.image,
    required this.maintext,
    required this.subtext,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 95.w, // Define a largura para 95% da tela
        margin: EdgeInsets.symmetric(vertical: 0.8.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Row(
              children: [
                // Avatar circular responsivo
                Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        maintext,
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 0.3.h),
                      Text(
                        subtext,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}