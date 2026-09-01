import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/constants/lacos_e_marcos_3.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/auth_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Image.asset("images/Logo.png", fit: BoxFit.contain),
              ),
              const SizedBox(height: 20),
              const LacosEMarcos3(),
              const SizedBox(height: 40),
              
              const AuthTextField(text: "Email", icon: Icons.email),
              const SizedBox(height: 12),
              const AuthTextField(text: "Senha", icon: Icons.lock),
              const SizedBox(height: 20),
              
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.selectProfile,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Entrar",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.forgotPass);
                    },
                    child: Text(
                      "Esqueci minha senha",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.primaryButton,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ainda não tem uma conta? ",
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.register);
                    },
                    child: Text(
                      "Criar conta",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.primaryButton,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}