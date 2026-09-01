import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Esqueceu sua senha?",
              style: textTheme.titleLarge?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Digite seu e-mail ou número de telefone,\nenviaremos um código de confirmação",
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 30),

            // Seletor de Abas (E-mail / Telefone)
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFEBEBEB),
                ),
                color: const Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                labelColor: AppColors.primaryButton,
                labelStyle: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Tab(text: "E-mail"),
                  Tab(text: "Telefone"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Conteúdo das Abas
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent(
                    context: context,
                    hintText: "Digite seu e-mail",
                    icon: Icons.email_outlined,
                  ),
                  _buildTabContent(
                    context: context,
                    hintText: "Digite seu telefone",
                    icon: Icons.phone_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent({
    required BuildContext context,
    required String hintText,
    required IconData icon,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.primaryButton),
            hintText: hintText,
            hintStyle: textTheme.bodyMedium?.copyWith(
              color: Colors.black38,
            ),
            filled: true,
            fillColor: const Color(0xFFF8F8F8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Código de verificação enviado!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "Redefinir senha",
              style: textTheme.titleMedium?.copyWith(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}