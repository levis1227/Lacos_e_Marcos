import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';

class AuthSocialLoginButton extends StatelessWidget {
  final String text;
  final String? logo; 
  final VoidCallback? onTap;

  const AuthSocialLoginButton({
    super.key,
    required this.text,
    this.logo, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Renderiza a logo apenas se ela for informada
            if (logo != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.07,
                  child: Image.asset(logo!, filterQuality: FilterQuality.high),
                ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xFF2C2C2C),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Mantém a simetria do alinhamento apenas quando houver logo
            if (logo != null) const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}