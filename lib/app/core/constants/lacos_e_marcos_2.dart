import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';

class LacosEMarcos2 extends StatelessWidget {
  const LacosEMarcos2({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Bem-vindo(a) ao\n',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          TextSpan(
            text: 'Laços ',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
              height: 1.3,
            ),
          ),
          TextSpan(
            text: 'e ',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: AppColors.green,
            ),
          ),
          TextSpan(
            text: 'Marcos!\n',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
          TextSpan(
            text: '\nAcompanhe cada conquista\nreceba orientações e receba\nesse laço de amor.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
