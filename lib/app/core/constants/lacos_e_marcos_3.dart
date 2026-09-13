import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';

class LacosEMarcos3 extends StatelessWidget {
  const LacosEMarcos3({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Laços\n',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: 'e ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: AppColors.orange,
            ),
          ),
          TextSpan(
            text: 'Marcos',
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
