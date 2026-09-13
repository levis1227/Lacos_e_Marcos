import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';

class CommentTextField extends StatelessWidget {
  final String text;
  final IconData? icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CommentTextField({
    super.key,
    required this.text,
    this.icon,
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
        width: MediaQuery.of(context).size.width*0.95,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          maxLines: 4, 
          textAlignVertical: TextAlignVertical.top,
          style: textTheme.bodyMedium,
          decoration: InputDecoration(
            fillColor: Colors.white, 
            filled: true,
            hintText: text,
            hintStyle: textTheme.bodyMedium?.copyWith(color: Colors.black38),
            prefixIcon: icon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(icon, color: AppColors.primaryButton),
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE2E2E2), width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE2E2E2), width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE2E2E2), width: 1.2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}