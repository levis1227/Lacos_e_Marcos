import 'package:flutter/material.dart';
import 'package:projeto_atual/app/modules/development/pages/timeline_status_page.dart';
import 'package:projeto_atual/app/modules/marcos/pages/marco_register_page.dart';
import 'package:projeto_atual/app/widgets/child_profile_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/routes/routes_names.dart';
import 'package:projeto_atual/app/widgets/list_icons.dart';
import 'package:projeto_atual/app/widgets/progresso_marcos_card.dart';
import 'package:projeto_atual/app/widgets/proximos_marcos_card.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background,
        elevation: 0,
        toolbarHeight: 10.h,
        leading: IconButton(
          icon: Icon(Icons.menu, size: 24.sp),
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.selectProfile);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
              icon: Icon(Icons.notifications_outlined, size: 24.sp),
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.selectProfile);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, Mamãe!",
                style: textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                "Que bom ter você aqui!",
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),

              SizedBox(height: 2.5.h),

              ChildProfileCard(
                name: 'Marcos',
                age: '6 meses e 12 dias',
                birthDate: 'Nascido em 10/10/2023',
                imagePath: 'images/avatar.jpg',
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.selectProfile);
                },
              ),

              SizedBox(height: 2.5.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progresso dos marcos",
                    style: textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.homepage);
                    },
                    child: Text(
                      "Ver todos",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primaryButton,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.5.h),

              ProgressoMarcosCard(
                chartSize: 38.w,
                onVerTodosTap: () {
                  Navigator.pushNamed(context, RoutesName.homepage);
                },
              ),
              SizedBox(height: 1.h),

              ProximosMarcosCard(
                title: 'Sentar sem apoio',
                ageRange: 'Entre 6 e 7 meses',
                imagePath: "images/avatar.jpg",
                icon: Icons.arrow_forward_ios_rounded,
                iconColor: AppColors.textSecondary,
                onTap: () {
                },  
              ),

              SizedBox(height: 1.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MarcoRegisterPage(),
                        ),
                      );
                    },
                    child: const ListIcons(
                      icon: Icons.add,
                      text: "Registrar\nMarco",
                      cor: AppColors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimelineStatusPage(),
                        ),
                      );
                    },
                    child: const ListIcons(
                      icon: Icons.bar_chart,
                      text: "Ver\ndesenvolvimento",
                      cor: AppColors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.selectProfile);
                    },
                    child: const ListIcons(
                      icon: Icons.calendar_month,
                      text: "Agenda",
                      cor: AppColors.orange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.orientations);
                    },
                    child: const ListIcons(
                      icon: Icons.menu_book,
                      text: "Orientações",
                      cor: AppColors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.5.h),
            ],
          ),
        ),
      ),
    );
  }
}
