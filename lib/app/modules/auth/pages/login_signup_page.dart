import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),

            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Logo.png"),
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vamos começar!",
                  style: textTheme.titleLarge?.copyWith(fontSize: 22.sp),
                ),
              ],
            ),
            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    "Faça login para aproveitar todos os\n recursos e acompanhar cada momento",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 15.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
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
            const SizedBox(height: 20),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.register);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.background,
                  side: const BorderSide(color: Colors.black12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Cadastrar-se",
                  style: textTheme.titleMedium?.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.primaryButton,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
