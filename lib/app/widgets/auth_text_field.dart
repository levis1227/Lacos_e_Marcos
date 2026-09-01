import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';

class AuthTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.text,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            fillColor: const Color(0xFFF7F7F7),
            filled: true,
            hintText: text,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: Colors.black38,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(icon, color: AppColors.primaryButton),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}