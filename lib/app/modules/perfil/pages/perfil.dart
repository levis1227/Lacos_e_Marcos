import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/core/theme/app_typography.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/profile_list_perfil.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  bool _notificacoesAtivas = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 10.h,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.selectProfile);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
              icon: Icon(Icons.edit_outlined, size: 24.sp),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.selectProfile);
              },
            ),
          ),
        ],
        title: Text(
          "Perfil da criança",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 1.h),

              // Avatar da Criança Proporcional
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 35.w,
                      height: 35.w,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8.w, color: AppColors.background),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("images/avatar.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 8.w,
                        width: 8.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 0.3.w, color: Colors.black54),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 16.sp,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2.h),

              // Textos do Perfil com Tipografia Responsiva
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Marcos",
                    style: AppTypography.titleLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 19.sp,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "6 meses e 12 dias",
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 0.3.h),
                  Text(
                    "Nascido em 10/10/2023",
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.5.h),

              // Card Arredondado Proporcional
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.w),
                  border: Border.all(
                    color: const Color(0xFFE2E2E2),
                    width: 0.3.w,
                  ),
                ),
                child: Column(
                  children: [
                    ProfileListPerfil(
                      title: "Informações da criança",
                      icon: Icons.person_outline,
                      color: Colors.black87,
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                        size: 18.sp,
                      ),
                      onTap: () {},
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E2E2)),
                    ProfileListPerfil(
                      title: "Cuidadores",
                      icon: Icons.people_outline,
                      color: Colors.black87,
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                        size: 18.sp,
                      ),
                      onTap: () {},
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E2E2)),
                    ProfileListPerfil(
                      title: "Notificações",
                      icon: Icons.notifications_none,
                      color: Colors.black87,
                      trailing: Transform.scale(
                        scale: 0.85,
                        child: Switch(
                          value: _notificacoesAtivas,
                          activeThumbColor: Colors.white,
                          activeTrackColor: AppColors.primaryButton,
                          onChanged: (value) {
                            setState(() {
                              _notificacoesAtivas = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E2E2)),
                    ProfileListPerfil(
                      title: "Configurações",
                      icon: Icons.settings_outlined,
                      color: Colors.black87,
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                        size: 18.sp,
                      ),
                      onTap: () {},
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E2E2)),
                    ProfileListPerfil(
                      title: "Sobre o app",
                      icon: Icons.info_outline,
                      color: Colors.black87,
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.black45,
                        size: 18.sp,
                      ),
                      onTap: () {},
                    ),
                    const Divider(height: 1, color: Color(0xFFE2E2E2)),
                    ProfileListPerfil(
                      title: "Sair",
                      icon: Icons.logout,
                      color: Colors.red,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}