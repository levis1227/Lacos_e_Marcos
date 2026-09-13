import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/auth_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Criar conta",
          style: textTheme.titleLarge?.copyWith(
            fontSize: 22.sp,
            color: Colors.black87,
          ),
        ),
        toolbarHeight: 90,
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const AuthTextField(text: "Digite seu nome", icon: Icons.person),
              const SizedBox(height: 12),
              const AuthTextField(text: "Digite seu e-mail", icon: Icons.email),
              const SizedBox(height: 12),
              const AuthTextField(text: "Digite sua senha", icon: Icons.lock),
              const SizedBox(height: 12),
              const AuthTextField(text: "Confirme sua senha", icon: Icons.lock),
              const SizedBox(height: 30),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.linkBaby,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Criar conta",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Já tem uma conta? ",
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text(
                      "Entrar",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primaryButton,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
